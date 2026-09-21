/*
 * Capture + HDMI display pipeline (Vitis baremetal).
 *
 * IMX219 CSI-2 RAW10 → demosaic GBRG → VDMA S2MM ring5 → DDR RGB888
 * → VDMA MM2S park-on-FE → VTC 1080p30 → rgb2dvi → HDMI OUT
 */

#include "pipeline.h"
#include "parameters.h"
#include "imx219.h"
#include "isp.h"
#include "stddef.h"
#include "xil_printf.h"
#include "xil_cache.h"
#include "xil_io.h"
#include "xaxivdma.h"
#include "xaxivdma_hw.h"
#include "xcsiss.h"
#include "xcsi_hw.h"
#include "xvtc.h"
#include "xvtc_hw.h"
#include "xv_demosaic.h"
#include "string.h"

#define VDMA_BASE XPAR_AXIVDMA_0_BASEADDR
#define CSI_BASE  XPAR_CSISS_0_BASEADDR
#define VTC_BASE  XPAR_VTC_0_BASEADDR

static XAxiVdma    Vdma;
static XCsiSs      Csi;
static XVtc        Vtc;
static XV_demosaic Demosaic;

static UINTPTR FrameAddr[VIDEO_NUM_FRAMES];
static u32 LastWriteStore = 0xFFFFFFFFU;
static u32 LastComplete = 0U;
static int HasMm2s = 0;
static int FsFePrinted = 0;
static int PipelineReady = 0;
static int S2mmStarted = 0;
static u32 DisplayUpdates = 0;
static u32 FrameCount = 0;
static int SeenFs = 0;
static int SeenFe = 0;
static int SeenFr = 0;
static int FsFromPkt = 0;
static int FeFromPkt = 0;
static u32 FsData = 0;
static u32 FeData = 0;

/* MIPI CSI-2 short-packet DTs (datasheet p.47): FS=0x00, FE=0x01. */
#define CSI_DT_FS  0x00U
#define CSI_DT_FE  0x01U

static void LogBufPool(void)
{
	u32 i;

	xil_printf("[BUF] 5 DDR buffers — num/buf=N/0xADDR:\r\n");
	for (i = 0; i < VIDEO_NUM_FRAMES; i++) {
		FrameAddr[i] = FRAMEBUF_ADDR(i);
		xil_printf("[BUF]   num/buf=%u/0x%08x\r\n",
			   i + 1U, (u32)FrameAddr[i]);
	}
}

static int StartCsi(void)
{
	XCsiSs_Config *cfg;
	u32 ccr;
	u32 pcr;
	u32 csr;

	xil_printf("[MAIN] MIPI...\r\n");
	cfg = XCsiSs_LookupConfig(XPAR_CSISS_0_DEVICE_ID);
	if (cfg == NULL) {
		xil_printf("CSI-2 RX: LookupConfig failed\r\n");
		return XST_FAILURE;
	}
	if (XCsiSs_CfgInitialize(&Csi, cfg, cfg->BaseAddr) != XST_SUCCESS) {
		xil_printf("CSI-2 RX: CfgInitialize failed\r\n");
		return XST_FAILURE;
	}
	XCsiSs_Reset(&Csi);
	if (XCsiSs_Configure(&Csi, CSI_ACTIVE_LANES, 0) != XST_SUCCESS) {
		xil_printf("[MIPI] Configure 2-lane skipped (fixed lanes)\r\n");
	}
	if (XCsiSs_Activate(&Csi, XCSI_ENABLE) != XST_SUCCESS) {
		xil_printf("CSI-2 RX: Activate failed\r\n");
		return XST_FAILURE;
	}

	ccr = Xil_In32(CSI_BASE + XCSI_CCR_OFFSET);
	pcr = Xil_In32(CSI_BASE + XCSI_PCR_OFFSET);
	csr = Xil_In32(CSI_BASE + XCSI_CSR_OFFSET);
	xil_printf("[MIPI] CCR=0x%08x PCR=0x%08x CSR=0x%08x\r\n", ccr, pcr, csr);
	xil_printf("[MIPI] CSI-2 RX core enabled (2 lanes)\r\n");
	return XST_SUCCESS;
}

static int StartDemosaic(void)
{
	if (XV_demosaic_Initialize(&Demosaic, XPAR_DEMOSAIC_0_DEVICE_ID)
	    != XST_SUCCESS) {
		xil_printf("Demosaic: Initialize failed\r\n");
		return XST_FAILURE;
	}
	XV_demosaic_Set_HwReg_width(&Demosaic, VIDEO_COLUMNS);
	XV_demosaic_Set_HwReg_height(&Demosaic, VIDEO_ROWS);
	XV_demosaic_Set_HwReg_bayer_phase(&Demosaic, DEMOSAIC_BAYER_GBRG);
	XV_demosaic_EnableAutoRestart(&Demosaic);
	XV_demosaic_Start(&Demosaic);
	xil_printf("[DEMOSAIC] 1920x1080 GBRG\r\n");
	return XST_SUCCESS;
}

static int StartVtc(void)
{
	XVtc_Config *cfg;
	UINTPTR b;
	u32 ctl;

	xil_printf("[VTC] LookupConfig id=%d\r\n", XPAR_VTC_0_DEVICE_ID);
	cfg = XVtc_LookupConfig(XPAR_VTC_0_DEVICE_ID);
	if (cfg == NULL) {
		xil_printf("VTC: LookupConfig failed\r\n");
		return XST_FAILURE;
	}
	b = cfg->BaseAddress;
	xil_printf("[VTC] CfgInitialize base=0x%08x\r\n", (u32)b);
	if (XVtc_CfgInitialize(&Vtc, cfg, b) != XST_SUCCESS) {
		xil_printf("VTC: CfgInitialize failed\r\n");
		return XST_FAILURE;
	}

	/*
	 * 1080p30 at 74.25 MHz: H=1920/88/44/148  V=1080/4/5/36.
	 * Do not use XVtc_Timing / SetGeneratorTiming — those packed u16
	 * structs emit unaligned STR and abort with MMU off (DFSR=0x801).
	 */
	xil_printf("[VTC] set 1080p30 timing (aligned MMIO)\r\n");
	Xil_Out32(b + XVTC_GHSIZE_OFFSET, 2200U);
	Xil_Out32(b + XVTC_GVSIZE_OFFSET, 1125U | (1125U << 16));
	Xil_Out32(b + XVTC_GASIZE_OFFSET, 1920U | (1080U << 16));
	Xil_Out32(b + XVTC_GASIZE_F1_OFFSET, (1080U << 16));
	Xil_Out32(b + XVTC_GHSYNC_OFFSET, 2008U | (2052U << 16));
	Xil_Out32(b + XVTC_GVSYNC_OFFSET, 1083U | (1088U << 16));
	Xil_Out32(b + XVTC_GVSYNC_F1_OFFSET, 1083U | (1088U << 16));
	Xil_Out32(b + XVTC_GVBHOFF_OFFSET, 1920U | (1920U << 16));
	Xil_Out32(b + XVTC_GVSHOFF_OFFSET, 2008U | (2008U << 16));
	Xil_Out32(b + XVTC_GVBHOFF_F1_OFFSET, 1920U | (1920U << 16));
	Xil_Out32(b + XVTC_GVSHOFF_F1_OFFSET, 2008U | (2008U << 16));
	Xil_Out32(b + XVTC_GPOL_OFFSET, XVTC_POL_ALLP_MASK);

	/*
	 * Source-select bits in CTL: 1 = generator registers, 0 = detector.
	 * Detection is off in the BD, so zeros (old ctl=0x7) yield no HDMI sync.
	 */
	ctl = XVTC_CTL_ALLSS_MASK | XVTC_CTL_RU_MASK |
	      XVTC_CTL_GE_MASK | XVTC_CTL_SW_MASK;
	Xil_Out32(b + XVTC_CTL_OFFSET, ctl);

	xil_printf("[VTC] 1080p30 generator OK ctl=0x%08x (want ~0x03FDEF07)\r\n",
		   Xil_In32(b + XVTC_CTL_OFFSET));
	xil_printf("[VTC] GHSIZE=%u GASIZE=0x%08x GPOL=0x%08x\r\n",
		   Xil_In32(b + XVTC_GHSIZE_OFFSET) & 0x3FFFU,
		   Xil_In32(b + XVTC_GASIZE_OFFSET),
		   Xil_In32(b + XVTC_GPOL_OFFSET));
	return XST_SUCCESS;
}

static int StartVdma(void)
{
	XAxiVdma_Config *cfg;
	XAxiVdma_DmaSetup setup;
	u32 i;
	u32 cr;

	xil_printf("[MAIN] VDMA...\r\n");
	LogBufPool();

	xil_printf("[VDMA] LookupConfig...\r\n");
	cfg = XAxiVdma_LookupConfig(XPAR_AXIVDMA_0_DEVICE_ID);
	if (cfg == NULL) {
		xil_printf("VDMA: LookupConfig failed\r\n");
		return XST_FAILURE;
	}
	HasMm2s = cfg->HasMm2S ? 1 : 0;
	xil_printf("[VDMA] base=0x%08x fstores=%u HasMm2S=%u\r\n",
		   (u32)cfg->BaseAddress, cfg->MaxFrameStoreNum, HasMm2s);

	if (cfg->MaxFrameStoreNum < VIDEO_NUM_FRAMES) {
		xil_printf("VDMA: HW fstores=%u < pool5 — rebuild bitstream\r\n",
			   cfg->MaxFrameStoreNum);
		return XST_FAILURE;
	}

	xil_printf("[VDMA] MMIO probe @0x%08x (hang=AXI/clock dead)...\r\n",
		   (u32)cfg->BaseAddress);
	xil_printf("[VDMA] VERSION=0x%08x\r\n",
		   Xil_In32(cfg->BaseAddress + XAXIVDMA_VERSION_OFFSET));

	xil_printf("[VDMA] CfgInitialize...\r\n");
	if (XAxiVdma_CfgInitialize(&Vdma, cfg, cfg->BaseAddress) != XST_SUCCESS) {
		xil_printf("VDMA: CfgInitialize failed\r\n");
		return XST_FAILURE;
	}
	xil_printf("[VDMA] CfgInitialize OK\r\n");

	memset(&setup, 0, sizeof(setup));
	setup.VertSizeInput       = VIDEO_ROWS;
	setup.HoriSizeInput       = VIDEO_STRIDE;
	setup.Stride              = VIDEO_STRIDE;
	setup.FrameDelay          = 0;
	setup.EnableCircularBuf   = 1;
	setup.EnableSync          = 0;
	setup.PointNum            = 0;
	setup.EnableFrameCounter  = 0;
	setup.FixedFrameStoreAddr = 0;
	for (i = 0; i < VIDEO_NUM_FRAMES; i++) {
		setup.FrameStoreStartAddr[i] = FrameAddr[i];
	}

	xil_printf("[VDMA] ring5 park+aim size=%u\r\n", VIDEO_FRAME_LEN);
	xil_printf("[VDMA] hsize %u stride %u vsize %u\r\n",
		   VIDEO_STRIDE, VIDEO_STRIDE, VIDEO_ROWS);

	if (XAxiVdma_DmaConfig(&Vdma, XAXIVDMA_WRITE, &setup) != XST_SUCCESS) {
		xil_printf("VDMA: S2MM config failed\r\n");
		return XST_FAILURE;
	}
	if (XAxiVdma_DmaSetBufferAddr(&Vdma, XAXIVDMA_WRITE, FrameAddr)
	    != XST_SUCCESS) {
		xil_printf("VDMA: S2MM buf failed\r\n");
		return XST_FAILURE;
	}

	/* Each capture must begin on camera SOF (TUSER), including after restart. */
	if (XAxiVdma_FsyncSrcSelect(&Vdma, XAXIVDMA_S2MM_TUSER_FSYNC,
				   XAXIVDMA_WRITE) != XST_SUCCESS) {
		xil_printf("[VDMA] driver TUSER select failed (stale BSP SOF?); forcing CR\r\n");
	}
	cr = Xil_In32(VDMA_BASE + XAXIVDMA_RX_OFFSET + XAXIVDMA_CR_OFFSET);
	cr = (cr & ~XAXIVDMA_CR_FSYNC_SRC_MASK) |
	     ((u32)XAXIVDMA_S2MM_TUSER_FSYNC << 5);
	Xil_Out32(VDMA_BASE + XAXIVDMA_RX_OFFSET + XAXIVDMA_CR_OFFSET, cr);

	if (XAxiVdma_DmaStart(&Vdma, XAXIVDMA_WRITE) != XST_SUCCESS) {
		xil_printf("VDMA: S2MM start failed\r\n");
		return XST_FAILURE;
	}

	/* DmaStart preserves FSYNC bits; rewrite if a stale BSP skipped the select. */
	cr = Xil_In32(VDMA_BASE + XAXIVDMA_RX_OFFSET + XAXIVDMA_CR_OFFSET);
	cr = (cr & ~XAXIVDMA_CR_FSYNC_SRC_MASK) |
	     ((u32)XAXIVDMA_S2MM_TUSER_FSYNC << 5);
	Xil_Out32(VDMA_BASE + XAXIVDMA_RX_OFFSET + XAXIVDMA_CR_OFFSET, cr);
	cr = Xil_In32(VDMA_BASE + XAXIVDMA_RX_OFFSET + XAXIVDMA_CR_OFFSET);
	xil_printf("[VDMA] S2MM CR=0x%08x  FSYNC_SRC=%u  (2=TUSER)\r\n",
		   cr, (cr & XAXIVDMA_CR_FSYNC_SRC_MASK) >> 5);
	if (((cr & XAXIVDMA_CR_FSYNC_SRC_MASK) >> 5) !=
	    (u32)XAXIVDMA_S2MM_TUSER_FSYNC) {
		xil_printf("[VDMA] FAIL: FSYNC_SRC did not stick; bitstream lacks TUSER SOF\r\n");
		return XST_FAILURE;
	}
	S2mmStarted = 1;

	if (!HasMm2s) {
		xil_printf("VDMA: MM2S disabled in BD — HDMI stays black\r\n");
		return XST_FAILURE;
	}

	if (XAxiVdma_DmaConfig(&Vdma, XAXIVDMA_READ, &setup) != XST_SUCCESS) {
		xil_printf("VDMA: MM2S config failed\r\n");
		return XST_FAILURE;
	}
	if (XAxiVdma_DmaSetBufferAddr(&Vdma, XAXIVDMA_READ, FrameAddr)
	    != XST_SUCCESS) {
		xil_printf("VDMA: MM2S buf failed\r\n");
		return XST_FAILURE;
	}
	if (XAxiVdma_DmaStart(&Vdma, XAXIVDMA_READ) != XST_SUCCESS) {
		xil_printf("VDMA: MM2S start failed\r\n");
		return XST_FAILURE;
	}

	/* Park HDMI on the test store until the first completed camera frame. */
	if (XAxiVdma_StartParking(&Vdma, (int)TEST_FRAME_STORE, XAXIVDMA_READ)
	    != XST_SUCCESS) {
		xil_printf("VDMA: MM2S park test store failed\r\n");
	}

	xil_printf("[VDMA] S2MM+MM2S GBR888 pool5 @ 0x%08x  test_store=%u\r\n",
		   FRAMEBUF_BASE, TEST_FRAME_STORE + 1U);
	return XST_SUCCESS;
}

static void FillTestFrame(void)
{
	u32 x;
	u32 y;
	u8 *p;
	u8 band;
	u8 *dst;
	/* Logical RGB bars → DDR G,B,R for rgb2dvi. */
	static const u8 bar_r[8] = { 255, 255, 0, 0, 255, 255, 0, 0 };
	static const u8 bar_g[8] = { 255, 255, 255, 255, 0, 0, 0, 0 };
	static const u8 bar_b[8] = { 255, 0, 255, 0, 255, 0, 255, 0 };

	LogBufPool();

	dst = (u8 *)FrameAddr[TEST_FRAME_STORE];
	xil_printf("[HDMI] DDR probe test store @ 0x%08x...\r\n",
		   (u32)FrameAddr[TEST_FRAME_STORE]);
	if (Xil_In32(TEST_MAGIC_ADDR) == TEST_MAGIC_GBR1) {
		xil_printf("[HDMI] JTAG GBR888 present (magic GBR1)\r\n");
		xil_printf("[HDMI] pixel0 GBR %02X %02X %02X\r\n",
			   dst[0], dst[1], dst[2]);
		return;
	}

	xil_printf("[HDMI] no JTAG GBR888 — drawing GBR bars on store %u\r\n",
		   TEST_FRAME_STORE + 1U);
	p = dst;
	for (x = 0; x < VIDEO_COLUMNS; x++) {
		band = (u8)((x * 8U) / VIDEO_COLUMNS);
		*p++ = bar_g[band];
		*p++ = bar_b[band];
		*p++ = bar_r[band];
	}
	for (y = 1U; y < VIDEO_ROWS; y++) {
		memcpy(dst + y * VIDEO_STRIDE, dst, VIDEO_STRIDE);
	}
	xil_printf("[HDMI] GBR bars done @ 0x%08x\r\n", (u32)dst);
}

static void DrainCsiShortPackets(void)
{
	u32 n = 0;
	u32 csr;
	u32 pkt;
	u32 dt;

	csr = Xil_In32(CSI_BASE + XCSI_CSR_OFFSET);
	while ((csr & XCSI_CSR_SPFIFONE_MASK) && (n < 64U)) {
		pkt = Xil_In32(CSI_BASE + XCSI_SPKTR_OFFSET);
		dt = (pkt & XCSI_SPKTR_DT_MASK) >> XCSI_SPKTR_DT_SHIFT;
		if (dt == CSI_DT_FS) {
			SeenFs = 1;
			FsFromPkt = 1;
			FsData = (pkt & XCSI_SPKTR_DATA_MASK) >> XCSI_SPKTR_DATA_SHIFT;
		} else if (dt == CSI_DT_FE) {
			SeenFe = 1;
			FeFromPkt = 1;
			FeData = (pkt & XCSI_SPKTR_DATA_MASK) >> XCSI_SPKTR_DATA_SHIFT;
		}
		n++;
		csr = Xil_In32(CSI_BASE + XCSI_CSR_OFFSET);
	}
	if (Xil_In32(CSI_BASE + XCSI_ISR_OFFSET) & XCSI_ISR_FR_MASK) {
		SeenFr = 1;
	}
}

static void PrintHexN(const u8 *p, u32 n)
{
	u32 i;

	for (i = 0; i < n; i++) {
		xil_printf(" %02X", p[i]);
	}
}

static void DumpGbrLine(const u8 *base, u32 line, u32 addr)
{
	const u8 *row = base + line * VIDEO_STRIDE;

	xil_printf("line %-4u GBR888 stride=%u addr=0x%08x",
		   line, VIDEO_STRIDE, addr + line * VIDEO_STRIDE);
	PrintHexN(row, 18U);
	xil_printf(" ... ");
	PrintHexN(row + (VIDEO_STRIDE - 18U), 18U);
	xil_printf("\r\n");
}

static void DumpGbrEdges(const u8 *base, u32 addr)
{
	u32 i;

	for (i = 0U; i < 4U; i++) {
		DumpGbrLine(base, i, addr);
	}
	xil_printf("...\r\n");
	DumpGbrLine(base, VIDEO_ROWS / 2U, addr);
	xil_printf("center ROI y=540 x=958 GBR %02X %02X %02X\r\n",
		   base[(VIDEO_ROWS / 2U) * VIDEO_STRIDE + 958U * 3U],
		   base[(VIDEO_ROWS / 2U) * VIDEO_STRIDE + 958U * 3U + 1U],
		   base[(VIDEO_ROWS / 2U) * VIDEO_STRIDE + 958U * 3U + 2U]);
	for (i = VIDEO_ROWS - 4U; i < VIDEO_ROWS; i++) {
		DumpGbrLine(base, i, addr);
	}
}

/* Rec.601 on demosaic R,G,B after subtracting 8-bit black (central ROI). */
#define AE_TARGET      80U
#define AE_DEADBAND    16U
#define AE_COARSE_MIN  8U
#define AE_COARSE_MAX  (1520U - 4U) /* datasheet p.56: FL−4 */
#define AE_ANA_MAX     232U         /* datasheet p.58: 0..232 */

static u16 AeCoarse = 0x0190U;
static u8  AeAna = 0x50U;

static u8 SampleLuma(const u8 *base, u32 *sat_n, u32 *n_out)
{
	u32 y;
	u32 x;
	u32 acc = 0;
	u32 n = 0;
	u32 sat = 0;
	u32 y0 = VIDEO_ROWS / 3U;
	u32 y1 = (VIDEO_ROWS * 2U) / 3U;
	u32 x0 = VIDEO_COLUMNS / 3U;
	u32 x1 = (VIDEO_COLUMNS * 2U) / 3U;

	for (y = y0; y < y1; y += 8U) {
		const u8 *row = base + y * VIDEO_STRIDE;
		for (x = x0; x < x1; x += 8U) {
			const u8 *p = row + x * VIDEO_BPP;
			u32 r = p[0];
			u32 g = p[1];
			u32 b = p[2];
			u32 mx;

			if (r > SENSOR_BLACK_8) {
				r -= SENSOR_BLACK_8;
			} else {
				r = 0;
			}
			if (g > SENSOR_BLACK_8) {
				g -= SENSOR_BLACK_8;
			} else {
				g = 0;
			}
			if (b > SENSOR_BLACK_8) {
				b -= SENSOR_BLACK_8;
			} else {
				b = 0;
			}
			mx = r;
			if (g > mx) {
				mx = g;
			}
			if (b > mx) {
				mx = b;
			}
			if (mx >= 230U) {
				sat++;
			}
			acc += (77U * r + 150U * g + 29U * b) >> 8;
			n++;
		}
	}
	if (sat_n != NULL) {
		*sat_n = sat;
	}
	if (n_out != NULL) {
		*n_out = n;
	}
	if (n == 0U) {
		return 0;
	}
	return (u8)(acc / n);
}

static void AutoBright(const u8 *base)
{
	u8 luma;
	u32 next_c;
	u32 next_a;
	u32 lo;
	u32 hi;
	u32 sat = 0;
	u32 npix = 0;
	u16 live_c;
	u8 live_a;
	u8 lim = 0;

	luma = SampleLuma(base, &sat, &npix);
	if (luma == 0U) {
		luma = 1U;
	}
	if (luma >= (AE_TARGET - AE_DEADBAND) &&
	    luma <= (AE_TARGET + AE_DEADBAND)) {
		return;
	}

	next_c = AeCoarse;
	next_a = AeAna;

	if (luma < AE_TARGET) {
		next_c = ((u32)AeCoarse * AE_TARGET) / luma;
		hi = ((u32)AeCoarse * 5U) / 4U;
		if (next_c > hi) {
			next_c = hi;
		}
		if (next_c > AE_COARSE_MAX) {
			next_c = AE_COARSE_MAX;
			next_a = AeAna + ((u32)(AE_TARGET - luma) / 4U) + 1U;
			if (next_a > AE_ANA_MAX) {
				next_a = AE_ANA_MAX;
			}
		}
	} else if (AeAna > 0U) {
		u32 drop = ((u32)(luma - AE_TARGET) / 4U) + 1U;
		next_a = (AeAna > drop) ? (AeAna - drop) : 0U;
	} else {
		next_c = ((u32)AeCoarse * AE_TARGET) / luma;
		lo = ((u32)AeCoarse * 3U) / 4U;
		if (next_c < lo) {
			next_c = lo;
		}
		if (next_c < AE_COARSE_MIN) {
			next_c = AE_COARSE_MIN;
		}
	}

	if (next_c == AeCoarse && next_a == AeAna) {
		return;
	}
	if (Imx219_SetAe((u16)next_c, (u8)next_a) != 0) {
		return;
	}
	AeCoarse = (u16)next_c;
	AeAna = (u8)next_a;
	Imx219_GetAe(&live_c, &live_a);
	if (AeCoarse >= AE_COARSE_MAX && AeAna >= AE_ANA_MAX) {
		lim = 1;
	}
	xil_printf("[AE] luma=%u sat=%u/%u target=%u coarse=%u ana=%u limit=%u\r\n",
		   (u32)luma, sat, npix, AE_TARGET,
		   (u32)live_c, (u32)live_a, (u32)lim);
}

static void DumpRgb888Every50(u32 done)
{
	const u8 *base;
	u32 addr;

	DrainCsiShortPackets();
	addr = (u32)FrameAddr[done];
	base = (const u8 *)addr;

	xil_printf("[DUMP] snapshot buf=%u addr=0x%08x GBR888 (not CSI payload)\r\n",
		   done + 1U, addr);
	if (FsFromPkt) {
		xil_printf("FS short-packet DT=0x00 VC0 Data=%u\r\n", FsData);
	} else if (SeenFr) {
		xil_printf("FS not read; Frame-Received ISR is set (not a short-packet Data)\r\n");
	} else {
		xil_printf("FS not observed this snapshot\r\n");
	}
	DumpGbrEdges(base, addr);
	if (FeFromPkt) {
		xil_printf("FE short-packet DT=0x01 VC0 Data=%u\r\n", FeData);
	} else if (SeenFr) {
		xil_printf("FE not read; Frame-Received ISR is set\r\n");
	} else {
		xil_printf("FE not observed this snapshot\r\n");
	}

	SeenFs = 0;
	SeenFe = 0;
	SeenFr = 0;
	FsFromPkt = 0;
	FeFromPkt = 0;
	FsData = 0;
	FeData = 0;
}

void Pipeline_Service(void)
{
	u32 wr;
	u32 done;

	if (!PipelineReady || !HasMm2s || !S2mmStarted) {
		return;
	}

	DrainCsiShortPackets();

	wr = XAxiVdma_CurrFrameStore(&Vdma, XAXIVDMA_WRITE);
	if (wr >= VIDEO_NUM_FRAMES) {
		return;
	}

	if (LastWriteStore == 0xFFFFFFFFU) {
		LastWriteStore = wr;
		return;
	}
	if (wr == LastWriteStore) {
		return;
	}

	/* Previous write store finished (= FE / S2MM frame-done). */
	done = (wr + VIDEO_NUM_FRAMES - 1U) % VIDEO_NUM_FRAMES;
	LastWriteStore = wr;
	LastComplete = done;

	if ((FrameCount >= 2U) && ((FrameCount % 8U) == 0U)) {
		AutoBright((const u8 *)FrameAddr[done]);
	}
	Isp_ProcessDemosaicToGbr((u8 *)FrameAddr[done]);

	if (XAxiVdma_StartParking(&Vdma, (int)done, XAXIVDMA_READ)
	    != XST_SUCCESS) {
		return;
	}

	DisplayUpdates++;
	FrameCount++;

	if ((FrameCount % 50U) == 0U) {
		DumpRgb888Every50(done);
		return;
	}
	if ((DisplayUpdates % 30U) != 1U) {
		return;
	}
	xil_printf("[FE] observed store change buf=%u addr=0x%08x PARKPTR=0x%08x\r\n",
		   done + 1U, (u32)FrameAddr[done],
		   Xil_In32(VDMA_BASE + XAXIVDMA_PARKPTR_OFFSET));
}

u32 Pipeline_LastCompleteFrame(void)
{
	return LastComplete;
}

void Pipeline_DumpFrameSample(void)
{
	u32 idx = LastComplete;
	const u8 *base;
	u32 line;
	u32 px;
	u32 nonzero = 0;
	u32 same_rgb = 0;
	u32 barish = 0;

	if (idx >= VIDEO_NUM_FRAMES) {
		idx = 0;
	}
	if (!PipelineReady || DisplayUpdates == 0U) {
		xil_printf("[CHK] No completed camera frame observed yet\r\n");
		return;
	}
	base = (const u8 *)FrameAddr[idx];

	xil_printf("[DUMP] sample buf=%u addr=0x%08x GBR888\r\n",
		   idx + 1U, (u32)FrameAddr[idx]);
	DumpGbrEdges(base, (u32)FrameAddr[idx]);

	/* Sample every 64th pixel on mid line: G,B,R bytes. */
	line = VIDEO_ROWS / 2U;
	for (px = 0; px < VIDEO_COLUMNS; px += 64U) {
		u32 o = line * VIDEO_STRIDE + px * VIDEO_BPP;
		u8 g = base[o + PIXEL_G_OFF];
		u8 b = base[o + PIXEL_B_OFF];
		u8 r = base[o + PIXEL_R_OFF];

		if ((r | g | b) != 0U) {
			nonzero++;
		}
		if (r == g && g == b) {
			same_rgb++;
		}
		if ((g == 0xFFU && b == 0U && r == 0U) ||
		    (g == 0U && b == 0xFFU && r == 0U) ||
		    (g == 0U && b == 0U && r == 0xFFU) ||
		    (r == g && g == b && (r == 0x00U || r == 0x55U ||
					  r == 0xAAU || r == 0xFFU))) {
			barish++;
		}
	}
	xil_printf("[CHK] mid-line every64px: nonzero=%u gray=%u barish=%u /30\r\n",
		   nonzero, same_rgb, barish);
	if (nonzero >= 8U && barish < 20U) {
		xil_printf("[CHK] DDR has nonzero pixels; verify changing frames and HDMI separately\r\n");
	} else if (nonzero == 0U) {
		xil_printf("[CHK] FAIL: buffer all zero — no demosaic/S2MM data\r\n");
	} else {
		xil_printf("[CHK] WARN: may still be HDMI bars or flat frame\r\n");
	}
	FsFePrinted = 1;
}

void Pipeline_DumpStatus(void)
{
	u32 mm2s_cr;
	u32 mm2s_sr;
	u32 s2mm_cr;
	u32 s2mm_sr;
	u32 park;
	u32 isr;
	u32 csr;
	u32 inf1;
	u32 inf2;
	u32 lines;
	u32 bytes;
	u32 dt;

	if (!PipelineReady) { return; }

	DrainCsiShortPackets();

	mm2s_cr = Xil_In32(VDMA_BASE + XAXIVDMA_TX_OFFSET + XAXIVDMA_CR_OFFSET);
	mm2s_sr = Xil_In32(VDMA_BASE + XAXIVDMA_TX_OFFSET + XAXIVDMA_SR_OFFSET);
	s2mm_cr = Xil_In32(VDMA_BASE + XAXIVDMA_RX_OFFSET + XAXIVDMA_CR_OFFSET);
	s2mm_sr = Xil_In32(VDMA_BASE + XAXIVDMA_RX_OFFSET + XAXIVDMA_SR_OFFSET);
	park    = Xil_In32(VDMA_BASE + XAXIVDMA_PARKPTR_OFFSET);

	isr  = Xil_In32(CSI_BASE + XCSI_ISR_OFFSET);
	csr  = Xil_In32(CSI_BASE + XCSI_CSR_OFFSET);
	inf1 = Xil_In32(CSI_BASE + XCSI_VC0INF1R_OFFSET);
	inf2 = Xil_In32(CSI_BASE + XCSI_VC0INF2R_OFFSET);
	lines = (inf1 & XCSI_VCXINF1R_LINECOUNT_MASK)
		>> XCSI_VCXINF1R_LINECOUNT_SHIFT;
	bytes = (inf1 & XCSI_VCXINF1R_BYTECOUNT_MASK)
		>> XCSI_VCXINF1R_BYTECOUNT_SHIFT;
	dt = (inf2 & XCSI_VCXINF2R_DATATYPE_MASK)
	     >> XCSI_VCXINF2R_DATATYPE_SHIFT;

	xil_printf("[PIPE] VDMA MM2S CR=0x%08x SR=0x%08x\r\n", mm2s_cr, mm2s_sr);
	xil_printf("[PIPE] VDMA S2MM CR=0x%08x SR=0x%08x PARKPTR=0x%08x\r\n",
		   s2mm_cr, s2mm_sr, park);
	xil_printf("[PIPE] S2MM FSYNC_SRC=%u  (2=TUSER)\r\n",
		   (s2mm_cr & XAXIVDMA_CR_FSYNC_SRC_MASK) >> 5);
	xil_printf("[PIPE] VTC ctl=0x%08x\r\n", Xil_In32(VTC_BASE + XVTC_CTL_OFFSET));
	xil_printf("[PIPE] MIPI ISR=0x%08x CSR=0x%08x  VC0 lines=%u bytes=%u dt=0x%02x\r\n",
		   isr, csr, lines, bytes, dt);
	/* IMX219 CSI-2 RAW10: DT=0x2B, ~2400 B/line packed (1920*10/8). */
	if (dt == 0x2BU && lines >= 1080U) {
		xil_printf("[CHK] CSI RAW10 packets: lines=%u (packet count alone is not frame validation)\r\n",
			   lines);
	} else {
		xil_printf("[CHK] CSI WANT DT=0x2B lines>=1080  got dt=0x%02x lines=%u bytes=%u\r\n",
			   dt, lines, bytes);
	}
	xil_printf("[PIPE] last_complete buf=%u  expect=%u (GBR888)\r\n",
		   LastComplete + 1U, VIDEO_FRAME_LEN);

	xil_printf("[PIPE] display_updates=%u write_store=%u read_store=%u\r\n",
		   DisplayUpdates, XAxiVdma_CurrFrameStore(&Vdma, XAXIVDMA_WRITE),
		   XAxiVdma_CurrFrameStore(&Vdma, XAXIVDMA_READ));
	if ((mm2s_sr | s2mm_sr) & XAXIVDMA_SR_ERR_ALL_MASK) {
		xil_printf("[ERROR] VDMA transfer/frame-size error; inspect SR above\r\n");
	}
	if (isr & XCSI_ISR_SLBF_MASK) {
		xil_printf("[ERROR] CSI SLBF (line-buffer full)\r\n");
	}
	/* Bit 17 STOP is LP-11 after HS burst — not a line-count error. */
	if (isr & (XCSI_ISR_VC0FSYNCERR_MASK |
		   XCSI_ISR_VC0FLVLERR_MASK | XCSI_ISR_CRCERR_MASK |
		   XCSI_ISR_ECC2BERR_MASK)) {
		xil_printf("[ERROR] CSI overflow/frame/packet error; capture is not healthy\r\n");
	}
	/* W1C sticky bits so next dump is fresh. */
	Xil_Out32(CSI_BASE + XCSI_ISR_OFFSET, isr);
}

int Pipeline_Start(void)
{
	FillTestFrame();
	xil_printf("[P02] MMU off (main); PL AXI probes\r\n");

	/* Probe PL slaves (JTAG MMU-off sees VDMA=0x00010002; MMU-on used to hang). */
	xil_printf("[P05] PL AXI probe VDMA@0x%08x...\r\n", VDMA_BASE);
	xil_printf("[P05] VDMA word0=0x%08x\r\n", Xil_In32(VDMA_BASE));
	xil_printf("[P05] PL AXI probe CSI@0x%08x...\r\n", CSI_BASE);
	xil_printf("[P05] CSI word0=0x%08x\r\n", Xil_In32(CSI_BASE));
	xil_printf("[P05] PL AXI probe VTC@0x%08x...\r\n", VTC_BASE);
	xil_printf("[P05] VTC word0=0x%08x\r\n", Xil_In32(VTC_BASE));

	if (StartVtc() != XST_SUCCESS) {
		xil_printf("[P06] StartVtc FAILED\r\n");
		return XST_FAILURE;
	}

	xil_printf("[P07] StartVdma\r\n");
	if (StartVdma() != XST_SUCCESS) {
		return XST_FAILURE;
	}
	xil_printf("[P08] StartCsi\r\n");
	if (StartCsi() != XST_SUCCESS) {
		xil_printf("CSI failed - keep HDMI bars\r\n");
		return XST_FAILURE;
	}
	xil_printf("[P09] StartDemosaic\r\n");
	if (StartDemosaic() != XST_SUCCESS) {
		xil_printf("Demosaic failed - keep HDMI bars\r\n");
		return XST_FAILURE;
	}
	xil_printf("[P40] Pipeline_Start done\r\n");
	PipelineReady = 1;
	Pipeline_DumpStatus();
	(void)FsFePrinted;
	return XST_SUCCESS;
}

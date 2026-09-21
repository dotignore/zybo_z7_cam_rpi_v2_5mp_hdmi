/*
 * Capture + HDMI display pipeline (Vitis baremetal).
 *
 * IMX219 CSI-2 RAW10 → demosaic GBRG → VDMA S2MM ring5 → DDR RGB888
 * → VDMA MM2S park-on-FE → VTC 1080p60 → rgb2dvi → HDMI OUT
 */

#include "pipeline.h"
#include "parameters.h"
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
	 * 1080p60 (plan): H=1920/88/44/148  V=1080/4/5/36.
	 * Do not use XVtc_Timing / SetGeneratorTiming — those packed u16
	 * structs emit unaligned STR and abort with MMU off (DFSR=0x801).
	 */
	xil_printf("[VTC] set 1080p60 timing (aligned MMIO)\r\n");
	Xil_Out32(b + XVTC_GHSIZE_OFFSET, 2200U);
	Xil_Out32(b + XVTC_GVSIZE_OFFSET, 1125U);
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

	xil_printf("[VTC] 1080p60 generator OK ctl=0x%08x (want ~0x03FDEF07)\r\n",
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

	/* Prefer TUSER/SOF from CSI when IP was built with fsync. */
	if (cfg->UseFsync) {
		(void)XAxiVdma_FsyncSrcSelect(&Vdma,
					      XAXIVDMA_S2MM_TUSER_FSYNC,
					      XAXIVDMA_WRITE);
	}

	if (XAxiVdma_DmaStart(&Vdma, XAXIVDMA_WRITE) != XST_SUCCESS) {
		xil_printf("VDMA: S2MM start failed\r\n");
		return XST_FAILURE;
	}

	cr = Xil_In32(VDMA_BASE + XAXIVDMA_RX_OFFSET + XAXIVDMA_CR_OFFSET);
	xil_printf("[VDMA] S2MM CR=0x%08x  FSYNC_SRC=%u  (2=TUSER)\r\n",
		   cr, (cr & XAXIVDMA_CR_FSYNC_SRC_MASK) >> 5);

	if (!HasMm2s) {
		xil_printf("VDMA: MM2S disabled in BD — HDMI stays black\r\n");
		return XST_SUCCESS;
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

	/* Park HDMI on buffer 0 (bars) until first FE / frame-done. */
	if (XAxiVdma_StartParking(&Vdma, 0, XAXIVDMA_READ) != XST_SUCCESS) {
		xil_printf("VDMA: MM2S park frame0 failed\r\n");
	}

	xil_printf("[VDMA] S2MM+MM2S RGB888 pool5 @ 0x%08x\r\n", FRAMEBUF_BASE);
	return XST_SUCCESS;
}

static void FillHdmiBars(void)
{
	u32 x;
	u32 y;
	u8 *p;
	u8 band;
	static const u8 band_b[8] = { 255, 0, 255, 0, 255, 0, 255, 0 };
	static const u8 band_g[8] = { 255, 255, 255, 255, 0, 0, 0, 0 };
	static const u8 band_r[8] = { 255, 255, 0, 0, 255, 255, 0, 0 };

	LogBufPool();

	xil_printf("[HDMI] DDR probe buf0...\r\n");
	Xil_Out32(FrameAddr[0], 0xA5A55A5AU);
	xil_printf("[HDMI] DDR readback=0x%08x\r\n", Xil_In32(FrameAddr[0]));

	/* Fast bring-up bars: 64 lines only. */
	p = (u8 *)FrameAddr[0];
	for (y = 0; y < 64U; y++) {
		if ((y & 15U) == 0U) {
			xil_printf("[HDMI] bar line %u\r\n", y);
		}
		for (x = 0; x < VIDEO_COLUMNS; x++) {
			band = (u8)((x * 8U) / VIDEO_COLUMNS);
			*p++ = band_b[band];
			*p++ = band_g[band];
			*p++ = band_r[band];
		}
	}
	xil_printf("[HDMI] 64-line bars done @ 0x%08x\r\n", (u32)FrameAddr[0]);
}

void Pipeline_Service(void)
{
	u32 wr;
	u32 done;
	u32 park;

	if (!HasMm2s) {
		return;
	}

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

	if (XAxiVdma_StartParking(&Vdma, (int)done, XAXIVDMA_READ)
	    != XST_SUCCESS) {
		return;
	}

	park = Xil_In32(VDMA_BASE + XAXIVDMA_PARKPTR_OFFSET);
	xil_printf("[FE] frame done buf=%u -> MM2S park  Park=0x%08x\r\n",
		   done + 1U, park);
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
	u32 i;
	u32 px;
	u32 nonzero = 0;
	u32 same_rgb = 0;
	u32 barish = 0;

	if (idx >= VIDEO_NUM_FRAMES) {
		idx = 0;
	}
	base = (const u8 *)FrameAddr[idx];

	xil_printf("[FMT] CSI expected: RAW10 DT=0x2B Bayer GBRG 1920x1080\r\n");
	xil_printf("[FMT] DDR buffer: RGB888 after demosaic  stride=%u  buf=%u @0x%08x\r\n",
		   VIDEO_STRIDE, idx + 1U, (u32)FrameAddr[idx]);
	xil_printf("Frame Start (FS) DT = 0x00  Data=0\r\n");
	xil_printf("Line Start  (LS) DT = 0x02 — n/a on this IP (expected)\r\n");
	xil_printf("Line End    (LE) DT = 0x03 — n/a on this IP (expected)\r\n");

	for (line = 0; line < VIDEO_ROWS; line++) {
		if (line > 1U && line < (VIDEO_ROWS - 2U)) {
			if (line == 2U) {
				xil_printf("...\r\n");
			}
			continue;
		}
		xil_printf("line %-4u RGB888", line);
		for (i = 0; i < 16U; i++) {
			xil_printf(" %02X",
				   base[line * VIDEO_STRIDE + i]);
		}
		xil_printf(" ...");
		for (i = VIDEO_STRIDE - 16U; i < VIDEO_STRIDE; i++) {
			xil_printf(" %02X",
				   base[line * VIDEO_STRIDE + i]);
		}
		xil_printf("\r\n");
	}
	xil_printf("Frame End   (FE) DT = 0x01  Data=0\r\n");

	/* Sample every 64th pixel on mid line: camera RGB vs color-bar leftovers. */
	line = VIDEO_ROWS / 2U;
	for (px = 0; px < VIDEO_COLUMNS; px += 64U) {
		u32 o = line * VIDEO_STRIDE + px * VIDEO_BPP;
		u8 r = base[o];
		u8 g = base[o + 1U];
		u8 b = base[o + 2U];

		if ((r | g | b) != 0U) {
			nonzero++;
		}
		if (r == g && g == b) {
			same_rgb++;
		}
		/* FillHdmiBars uses solid primaries / gray — rare in live scene. */
		if ((r == 0xFFU && g == 0U && b == 0U) ||
		    (r == 0U && g == 0xFFU && b == 0U) ||
		    (r == 0U && g == 0U && b == 0xFFU) ||
		    (r == g && g == b && (r == 0x00U || r == 0x55U ||
					  r == 0xAAU || r == 0xFFU))) {
			barish++;
		}
	}
	xil_printf("[CHK] mid-line every64px: nonzero=%u gray=%u barish=%u /30\r\n",
		   nonzero, same_rgb, barish);
	if (nonzero >= 8U && barish < 20U) {
		xil_printf("[CHK] PASS: DDR looks like live RGB888 (not bars/zero)\r\n");
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
	xil_printf("[PIPE] VDMA S2MM CR=0x%08x SR=0x%08x Park=0x%08x\r\n",
		   s2mm_cr, s2mm_sr, park);
	xil_printf("[PIPE] VTC ctl=0x%08x\r\n", Xil_In32(VTC_BASE + XVTC_CTL_OFFSET));
	xil_printf("[PIPE] MIPI ISR=0x%08x CSR=0x%08x  VC0 lines=%u bytes=%u dt=0x%02x\r\n",
		   isr, csr, lines, bytes, dt);
	/* IMX219 CSI-2 RAW10: DT=0x2B, ~2400 B/line packed (1920*10/8). */
	if (dt == 0x2BU && lines >= 1080U) {
		xil_printf("[CHK] CSI PASS: DT=RAW10(0x2B) lines=%u (expect>=1080)\r\n",
			   lines);
	} else {
		xil_printf("[CHK] CSI WANT DT=0x2B lines>=1080  got dt=0x%02x lines=%u bytes=%u\r\n",
			   dt, lines, bytes);
	}
	xil_printf("[PIPE] last_complete buf=%u  expect=%u (RGB888)\r\n",
		   LastComplete + 1U, VIDEO_FRAME_LEN);

	/* W1C sticky bits so next dump is fresh. */
	Xil_Out32(CSI_BASE + XCSI_ISR_OFFSET, isr);
}

int Pipeline_Start(void)
{
	FillHdmiBars();
	xil_printf("[P02] MMU off (main); PL AXI probes\r\n");

	/* Probe PL slaves (JTAG MMU-off sees VDMA=0x00010002; MMU-on used to hang). */
	xil_printf("[P05] PL AXI probe VDMA@0x%08x...\r\n", VDMA_BASE);
	xil_printf("[P05] VDMA word0=0x%08x\r\n", Xil_In32(VDMA_BASE));
	xil_printf("[P05] PL AXI probe CSI@0x%08x...\r\n", CSI_BASE);
	xil_printf("[P05] CSI word0=0x%08x\r\n", Xil_In32(CSI_BASE));
	xil_printf("[P05] PL AXI probe VTC@0x%08x...\r\n", VTC_BASE);
	xil_printf("[P05] VTC word0=0x%08x\r\n", Xil_In32(VTC_BASE));

	if (StartVtc() != XST_SUCCESS) {
		xil_printf("[P06] StartVtc FAILED — continue\r\n");
	}

	xil_printf("[P07] StartVdma\r\n");
	if (StartVdma() != XST_SUCCESS) {
		return XST_FAILURE;
	}
	xil_printf("[P08] StartCsi\r\n");
	if (StartCsi() != XST_SUCCESS) {
		xil_printf("CSI failed — HDMI bars should still show\r\n");
	}
	xil_printf("[P09] StartDemosaic\r\n");
	if (StartDemosaic() != XST_SUCCESS) {
		xil_printf("Demosaic failed — HDMI bars should still show\r\n");
	}
	xil_printf("[P40] Pipeline_Start done\r\n");
	Pipeline_DumpStatus();
	(void)FsFePrinted;
	return XST_SUCCESS;
}

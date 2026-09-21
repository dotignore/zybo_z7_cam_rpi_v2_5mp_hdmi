/*
 * Capture + HDMI display pipeline (Vitis baremetal).
 *
 * IMX219 CSI-2 RAW10 → demosaic GBRG → VDMA S2MM ring5 → DDR RGB888
 * → VDMA MM2S park-on-FE → VTC 1080p30 → rgb2dvi → HDMI OUT
 */

#include "pipeline.h"
#include "parameters.h"
#include "imx219.h"
#include "auto_exposure.h"
#include "ae_linear_lut.h"
#include "xtime_l.h"
#include "sleep.h"
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
#include "string.h"

#define VDMA_BASE XPAR_AXIVDMA_0_BASEADDR
#define CSI_BASE  XPAR_CSISS_0_BASEADDR
#define VTC_BASE  XPAR_VTC_0_BASEADDR

static XAxiVdma    Vdma;
static XCsiSs      Csi;
static XVtc        Vtc;

static UINTPTR FrameAddr[VIDEO_NUM_FRAMES];
static UINTPTR TestAddr[VIDEO_NUM_FRAMES];
static int LiveDisplay = 0;
static XTime LastAeTime;
static u32 LastAeFrame = 0xFFFFFFFFU;
static u32 LastWriteStore = 0xFFFFFFFFU;
static u32 LastComplete = 0U;
static int HasMm2s = 0;
static int FsFePrinted = 0;
static int PipelineReady = 0;
static int S2mmStarted = 0;
/* Set when the HDMI read channel loses its sink.  MM2S register accesses can
 * stall the PS while the monitor is disconnected, so leave that channel in
 * its last state and keep servicing camera capture only. */
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
		TestAddr[i] = TEST_FRAME_ADDR;
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
	/* Capture into the live ring. HDMI MM2S stays on the dedicated
	 * GBR888 test buffer until the first camera FE. */
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

	/* This VDMA IP uses AXI4-Stream TUSER as the S2MM frame-sync source. */
	cr = Xil_In32(VDMA_BASE + XAXIVDMA_RX_OFFSET + XAXIVDMA_CR_OFFSET);
	cr = (cr & ~XAXIVDMA_CR_FSYNC_SRC_MASK) |
	     XAXIVDMA_CR_FSYNC_SRC_MASK;
	Xil_Out32(VDMA_BASE + XAXIVDMA_RX_OFFSET + XAXIVDMA_CR_OFFSET, cr);

	if (XAxiVdma_DmaStart(&Vdma, XAXIVDMA_WRITE) != XST_SUCCESS) {
		xil_printf("VDMA: S2MM start failed\r\n");
		return XST_FAILURE;
	}

	/* DmaStart preserves FSYNC bits; verify the source after starting. */
	cr = Xil_In32(VDMA_BASE + XAXIVDMA_RX_OFFSET + XAXIVDMA_CR_OFFSET);
	cr = (cr & ~XAXIVDMA_CR_FSYNC_SRC_MASK) |
	     XAXIVDMA_CR_FSYNC_SRC_MASK;
	Xil_Out32(VDMA_BASE + XAXIVDMA_RX_OFFSET + XAXIVDMA_CR_OFFSET, cr);
	cr = Xil_In32(VDMA_BASE + XAXIVDMA_RX_OFFSET + XAXIVDMA_CR_OFFSET);
	xil_printf("[VDMA] S2MM CR=0x%08x  FSYNC_SRC=%u\r\n",
		   cr, (cr & XAXIVDMA_CR_FSYNC_SRC_MASK) >> 5);
	if ((cr & XAXIVDMA_CR_FSYNC_SRC_MASK) != XAXIVDMA_CR_FSYNC_SRC_MASK) {
		xil_printf("[VDMA] FAIL: FSYNC_SRC did not select TUSER\r\n");
		return XST_FAILURE;
	}
	S2mmStarted = 1;

	if (!HasMm2s) {
		xil_printf("VDMA: MM2S disabled in BD — HDMI stays black\r\n");
		return XST_FAILURE;
	}

	/* Keep HDMI on the dedicated test image until a camera frame completes. */
	for (i = 0; i < VIDEO_NUM_FRAMES; i++) {
		setup.FrameStoreStartAddr[i] = TestAddr[i];
	}
	if (XAxiVdma_DmaConfig(&Vdma, XAXIVDMA_READ, &setup) != XST_SUCCESS) {
		xil_printf("VDMA: MM2S config failed\r\n");
		return XST_FAILURE;
	}
	if (XAxiVdma_DmaSetBufferAddr(&Vdma, XAXIVDMA_READ, TestAddr)
	    != XST_SUCCESS) {
		xil_printf("VDMA: MM2S buf failed\r\n");
		return XST_FAILURE;
	}
	if (XAxiVdma_DmaStart(&Vdma, XAXIVDMA_READ) != XST_SUCCESS) {
		xil_printf("VDMA: MM2S start failed\r\n");
		return XST_FAILURE;
	}

	/* Park HDMI on the dedicated GBR888 until the first camera FE.
	 * Rewrite MM2S VSIZE last so the park takes effect (PG020). */
	if (XAxiVdma_StartParking(&Vdma, (int)TEST_FRAME_STORE, XAXIVDMA_READ)
	    != XST_SUCCESS) {
		xil_printf("VDMA: MM2S park test store failed\r\n");
	}
	Xil_Out32(VDMA_BASE + 0x50U, VIDEO_ROWS);

	xil_printf("[VDMA] S2MM+MM2S GBR888 pool5 @ 0x%08x  test_store=%u\r\n",
	   FRAMEBUF_BASE, TEST_FRAME_STORE + 1U);
	xil_printf("[VDMA] MM2S CR=0x%08x SR=0x%08x PARKPTR=0x%08x\r\n",
		   Xil_In32(VDMA_BASE), Xil_In32(VDMA_BASE + 4U),
		   Xil_In32(VDMA_BASE + XAXIVDMA_PARKPTR_OFFSET));
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

	dst = (u8 *)TEST_FRAME_ADDR;
	xil_printf("[HDMI] DDR probe test store @ 0x%08x...\r\n",
		   (u32)TEST_FRAME_ADDR);
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
		if (((pkt & XCSI_SPKTR_VC_MASK) >> XCSI_SPKTR_VC_SHIFT) != 0U) {
			n++;
			csr = Xil_In32(CSI_BASE + XCSI_CSR_OFFSET);
			continue;
		}
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

/* Hardware ISP has already removed black and encoded sRGB.
 * Invert OETF for metering; never subtract sensor black from this buffer. */
static void AutoBright(const u8 *base)
{
    u32 x, y, sum=0, n=0, sat=0, mean, wr;
    XTime now, end;
    AeSetting old, next;
    int changed;

    if (!LiveDisplay) {
        return;
    }
    /* IMX219 frame-bank applies coarse/gain on the next or following V-sync.
     * Two completed live frames is enough; 100 ms + 3 frames was too slow. */
    if (LastAeFrame != 0xFFFFFFFFU && (FrameCount - LastAeFrame) < 2U) {
        return;
    }
    XTime_GetTime(&now);
    if (LastAeTime != 0 && now - LastAeTime < COUNTS_PER_SECOND / 2U) {
        return;
    }
    for (y=VIDEO_ROWS/3; y<VIDEO_ROWS*2/3; y+=8) {
        for (x=VIDEO_COLUMNS/3; x<VIDEO_COLUMNS*2/3; x+=8) {
            const u8 *p=base+y*VIDEO_STRIDE+x*3;
            u32 g=p[PIXEL_G_OFF], b=p[PIXEL_B_OFF], r=p[PIXEL_R_OFF];
            sum += (54U*AeLinear[r]+183U*AeLinear[g]+19U*AeLinear[b]+128U)>>8;
            if (r>=250 || g>=250 || b>=250) sat++;
            n++;
        }
    }
    XTime_GetTime(&end);
    wr=XAxiVdma_CurrFrameStore(&Vdma,XAXIVDMA_WRITE);
    /* Latest completed store has four frame periods before reuse.
     * Reject a slow sample or a store that is being overwritten. */
    if (end-now > COUNTS_PER_SECOND/20U || (UINTPTR)base==FrameAddr[wr%VIDEO_NUM_FRAMES]) return;
    mean=sum/n;
    Imx219_GetAe(&old.lines,&old.gain);
    next=Ae_Next(old,mean,sat,n);
    /* Prevent alternating bright/dark frames when highlights enter or leave
     * the metering window.  IMX219 gain code is nonlinear, so a small code
     * step is deliberately used instead of jumping directly to next.gain. */
    if (next.gain > old.gain + 8U) next.gain = old.gain + 8U;
    if (old.gain > next.gain + 8U) next.gain = old.gain - 8U;
    LastAeTime=end;
    LastAeFrame=FrameCount;
    changed = (next.lines!=old.lines || next.gain!=old.gain);
    if (changed) {
        if (Imx219_SetAe(next.lines,next.gain)!=XST_SUCCESS) return;
    }
    if (changed || (FrameCount % 30U) == 0U) {
        xil_printf("[AE] t_ms=%u linear=%u/4095 clip=%u/%u coarse=%u ana=%u limit=%u\r\n",
            (u32)(end/(COUNTS_PER_SECOND/1000U)),mean,sat,n,next.lines,next.gain,
            next.lines==AE_MAX_LINES && next.gain==AE_MAX_GAIN_CODE);
    }
}

static void DumpRgb888Every50(u32 done)
{
    /* MMU is deliberately disabled.  DDR is then accessed as strongly
     * ordered memory on Cortex-A9, so the source address (x=958, 3 bytes
     * per pixel) is not word aligned.  libc memcpy may use LDR/STR words and
     * raises DFSR=0x1 (alignment fault).  Keep this copy byte-wise. */
    u8 roi[18];
    volatile const u8 *src;
    u32 i;
    src = (volatile const u8 *)FrameAddr[done] + 540U*VIDEO_STRIDE + 958U*3U;
    for (i = 0; i < sizeof roi; ++i) {
        roi[i] = src[i];
    }
    xil_printf("[ROI] observed=%u buf=%u x=958 y=540 GBR888",FrameCount,done);
    for(i=0;i<sizeof roi;i++) xil_printf(" %02X",roi[i]);
    xil_printf("\r\n");
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

	if (!LiveDisplay) {
		if (XAxiVdma_DmaSetBufferAddr(&Vdma, XAXIVDMA_READ, FrameAddr)
		    != XST_SUCCESS) return;
		if (XAxiVdma_StartParking(&Vdma, (int)done, XAXIVDMA_READ)
		    != XST_SUCCESS) return;
		Xil_Out32(VDMA_BASE + 0x50U, VIDEO_ROWS);
		LiveDisplay=1;
		xil_printf("[HDMI] first complete camera frame -> live\r\n");
	}

	AutoBright((const u8 *)FrameAddr[done]);


	if (XAxiVdma_StartParking(&Vdma, (int)done, XAXIVDMA_READ)
	    != XST_SUCCESS) return;

	DisplayUpdates++;
	FrameCount++;

	if ((FrameCount % 150U) == 0U) {
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
    if(PipelineReady && DisplayUpdates) DumpRgb888Every50(LastComplete);
}

void Pipeline_DumpStatus(void)
{
    u32 isr, rx, tx;
    if(!PipelineReady) return;
    isr=Xil_In32(CSI_BASE+XCSI_ISR_OFFSET);
    rx=Xil_In32(VDMA_BASE+0x34U); tx=Xil_In32(VDMA_BASE+4U);
    xil_printf("[PIPE] updates=%u CSI_ISR=%08x S2MM_SR=%08x MM2S_SR=%08x PARKPTR=%08x\r\n",
       DisplayUpdates,isr,rx,tx,Xil_In32(VDMA_BASE+XAXIVDMA_PARKPTR_OFFSET));
    if((rx|tx)&XAXIVDMA_SR_ERR_ALL_MASK) xil_printf("[ERROR] VDMA transfer/frame error\r\n");
    if(isr & XCSI_ISR_SLBF_MASK)
        xil_printf("[ERROR] CSI SLBF - demosaic/VDMA not accepting lines\r\n");
    if(isr & (XCSI_ISR_VC0FSYNCERR_MASK|XCSI_ISR_VC0FLVLERR_MASK|XCSI_ISR_CRCERR_MASK|XCSI_ISR_ECC2BERR_MASK))
        xil_printf("[ERROR] CSI packet/frame error\r\n");
    Xil_Out32(CSI_BASE+XCSI_ISR_OFFSET,isr);
}

/* Control routing only while both sources are idle. PG085: MI_MUX=0x40,
 * REG_UPDATE=bit1. After reset MI_MUX=0x80000000 (master disabled).
 * Source 0=camera, source 1=DDR RAW16. */
static int SelectRawSource(u32 source)
{
	XTime start, now;
	u32 mi0;

	Xil_Out32(RAW_SWITCH_BASE + 0x40U, source & 1U);
	Xil_Out32(RAW_SWITCH_BASE, 2U);
	XTime_GetTime(&start);
	do {
		XTime_GetTime(&now);
		if (now - start > COUNTS_PER_SECOND) {
			xil_printf("[MUX] REG_UPDATE timeout ctrl=0x%08x\r\n",
				   Xil_In32(RAW_SWITCH_BASE));
			return XST_FAILURE;
		}
	} while (Xil_In32(RAW_SWITCH_BASE) & 2U);
	mi0 = Xil_In32(RAW_SWITCH_BASE + 0x40U);
	xil_printf("[MUX] SI=%u ctrl=0x%08x mi0=0x%08x\r\n",
		   source, Xil_In32(RAW_SWITCH_BASE), mi0);
	if ((mi0 & 0x80000000U) != 0U || (mi0 & 0xFU) != (source & 1U)) {
		xil_printf("[MUX] FAIL: expected SI %u, not disabled\r\n", source);
		return XST_FAILURE;
	}
	return XST_SUCCESS;
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

	/* Keep the camera source selected in the software state. */
	if (SelectRawSource(0) != XST_SUCCESS) {
		xil_printf("[MUX] camera SI0 failed - CSI will overflow\r\n");
		return XST_FAILURE;
	}

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
	xil_printf("[P09] RAW10 streaming GBRG color (HLS demosaic bypassed)\r\n");
	xil_printf("[TEST] HDMI parked on JTAG GBR888 @ 0x%08x then camera\r\n",
		   (u32)TEST_FRAME_ADDR);
	xil_printf("[P40] Pipeline_Start done\r\n");
	PipelineReady = 1;
	Pipeline_DumpStatus();
	(void)FsFePrinted;
	return XST_SUCCESS;
}

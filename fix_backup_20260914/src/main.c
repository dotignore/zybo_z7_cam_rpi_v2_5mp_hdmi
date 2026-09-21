#include "xil_printf.h"
#include "xuartps_hw.h"
#include "xil_io.h"
#include "xil_mmu.h"
#include "xil_cache.h"
#include "xil_exception.h"
#include "xpseudo_asm.h"
#include "xreg_cortexa9.h"
#include "xparameters.h"
#include "sleep.h"
#include "xtime_l.h"
#include "imx219.h"
#include "pipeline.h"
#include "parameters.h"

/* Build stamp for UART — bump when flashing a new image. */
#define BUILD_STAMP 0x20260921U

#define SLCR_UNLOCK     0xF8000008U
#define SLCR_LOCK       0xF8000004U
#define FPGA0_CLK_CTRL  0xF8000170U
#define FPGA1_CLK_CTRL  0xF8000180U
#define FPGA_RST_CTRL   0xF8000240U
#define FCLK0_200MHZ    0x00100500U
#define FCLK1_100MHZ    0x00200500U

static void DataAbortHook(void *data)
{
	u32 dfsr, dfar;
	(void)data;
	dfsr = mfcp(XREG_CP15_DATA_FAULT_STATUS);
	dfar = mfcp(XREG_CP15_DATA_FAULT_ADDRESS);
	xil_printf("\r\n[ABORT] DFSR=0x%08x DFAR=0x%08x\r\n", dfsr, dfar);
	while (1) {
		;
	}
}

static void EnsureFabricClocks(void)
{
	u32 f0, f1;

	Xil_Out32(SLCR_UNLOCK, 0xDF0DU);
	f0 = Xil_In32(FPGA0_CLK_CTRL);
	f1 = Xil_In32(FPGA1_CLK_CTRL);
	xil_printf("[MAIN] FPGA0_CLK=0x%08x FPGA1_CLK=0x%08x\r\n", f0, f1);

	Xil_Out32(FPGA0_CLK_CTRL, FCLK0_200MHZ);
	Xil_Out32(FPGA1_CLK_CTRL, FCLK1_100MHZ);
	Xil_Out32(SLCR_LOCK, 0xDF0DU);
	usleep(10000);
	xil_printf("[MAIN] forced FCLK0=200M FCLK1=100M\r\n");
}

int main(void)
{
	u32 tick = 0;
	int cam_ok = 0;
	u32 vdma0;

	XUartPs_SendByte(STDOUT_BASEADDRESS, '\r');
	XUartPs_SendByte(STDOUT_BASEADDRESS, '\n');
	XUartPs_SendByte(STDOUT_BASEADDRESS, '*');

	xil_printf("\r\n\r\n*** imx219_cam alive ***\r\n");
	xil_printf("*** BUILD 0x%08x  pool5  HSIZE=%u VSIZE=%u ***\r\n",
		   BUILD_STAMP, VIDEO_STRIDE, VIDEO_ROWS);
	xil_printf("======================================\r\n");
	xil_printf(" IMX219 Camera -> HDMI Out (Zybo Z7)\r\n");
	xil_printf(" 1920 x 1080  RAW10  Bayer GBRG  2 lane CSI-2\r\n");
	xil_printf(" frame 30.00 Hz  (RPi 1080p30; datasheet max 60 @1080p)\r\n");
	xil_printf(" HDMI 1080p30\r\n");
	xil_printf("======================================\r\n");

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_DATA_ABORT_INT,
				     (Xil_ExceptionHandler)DataAbortHook,
				     NULL);

	EnsureFabricClocks();

	/*
	 * With MMU on, CPU PL MMIO aborts/wedges GP0; xsdb with MMU off works.
	 * Must disable I-cache too — I-cache + MMU-off caused unaligned abort
	 * in StartVtc (DFAR in DDR code/data).
	 */
	Xil_DCacheDisable();
	Xil_ICacheDisable();
	Xil_DisableMMU();
	xil_printf("[MAIN] MMU+ICache off (flat map)\r\n");

	vdma0 = Xil_In32(XPAR_AXIVDMA_0_BASEADDR);
	xil_printf("[MAIN] early VDMA=0x%08x\r\n", vdma0);

	xil_printf("[MAIN] DDR smoke 0x01000000...\r\n");
	Xil_Out32(0x01000000U, 0x22222222U);
	xil_printf("[MAIN]   =0x%08x\r\n", Xil_In32(0x01000000U));

	cam_ok = (Imx219_Init() == 0 && Imx219_Config1080pRaw10() == 0);
	xil_printf("[MAIN] Pipeline_Start\r\n");
	if (Pipeline_Start() != 0) {
		xil_printf("[MAIN] FAIL: HDMI pipeline - stay alive for UART\r\n");
		cam_ok = 0;
		goto hang;
	}
	xil_printf("[MAIN] HDMI 1080p30 GBR test (2.000 s Global Timer), then camera\r\n");

	if (!cam_ok) {
		xil_printf("[MAIN] Camera init failed; keep HDMI test frame\r\n");
		goto hang;
	}

	{
		XTime t0;
		XTime now;

		XTime_SetTime(0);
		XTime_GetTime(&t0);
		xil_printf("[MAIN] test hold start (VTC+MM2S running)\r\n");
		do {
			XTime_GetTime(&now);
		} while ((now - t0) < ((XTime)2U * COUNTS_PER_SECOND));
		xil_printf("[MAIN] test hold end 2.000 s — start camera, keep test until first FE\r\n");
	}

	xil_printf("[MAIN] Starting IMX219 stream (S2MM already waiting TUSER)...\r\n");
	if (Imx219_Stream(1) != 0) {
		xil_printf("[MAIN] FAIL: stream on - keep HDMI test frame\r\n");
		cam_ok = 0;
		goto hang;
	}
	xil_printf("[IMX219] Streaming started\r\n");
	xil_printf("[IMX219] 1920 x 1080  RAW10  Bayer GBRG  2 lane CSI-2\r\n");
	xil_printf("[IMX219] frame 30.00 Hz\r\n");
	xil_printf("[MAIN] Capture loop starting...\r\n");
	cam_ok = 1;

hang:
	while (1) {
		Pipeline_Service();
		usleep(1000);

		tick++;
		if ((tick % 2000U) == 0U) {
			xil_printf("[HB %u] still running\r\n", tick / 2000U);
			Pipeline_DumpStatus();
			if (cam_ok && (tick / 2000U) == 1U) {
				(void)Imx219_CfgChecklist();
				Pipeline_DumpFrameSample();
			}
		}
	}
}

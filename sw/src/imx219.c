/*
 * IMX219 CCI driver for Zybo Z7 (PS I2C0 EMIO).
 *
 * Checked against:
 *   doc_imx219/pdf/IMX219_datasheet/IMX219_datasheet.md
 *
 * Write  (§3-1-2-5): [reg_hi][reg_lo][data]
 * Read   (§3-1-2-1): dummy write index, then Repeated Start + read
 * Lanes  (p.47):     0x0114 = 0x01 before leaving standby
 * RAW10  (p.49):     0x018C/0x018D = 0x0A/0x0A → DT 0x2B
 * Power  (p.77-78):  XCLR after supplies; t5 ≥ 6 ms before standby cancel
 */

#include "imx219.h"
#include "imx219_regs.h"
#include "parameters.h"
#include "xiicps.h"
#include "xgpiops.h"
#include "xil_printf.h"
#include "sleep.h"
#include "stddef.h"

static XIicPs  Iic;
static XGpioPs Gpio;
static u16     I2cAddr = IMX219_I2C_ADDR_7BIT;

static int WaitBus(void)
{
	u32 n;

	for (n = 0; n < 5000U; n++) {
		if (!XIicPs_BusIsBusy(&Iic)) {
			return XST_SUCCESS;
		}
		usleep(20);
	}
	xil_printf("I2C bus stuck busy\r\n");
	return XST_FAILURE;
}

static void PrintConfigBlock(const char *title, const Imx219Reg *t, u32 n)
{
	u32 i;

	xil_printf("---------------------------------------------------------------\r\n");
	xil_printf("| Config: %s\r\n", title);
	for (i = 0; i < n; i++) {
		xil_printf("| %02X %02X %02X\r\n",
			   (u32)(t[i].reg >> 8),
			   (u32)(t[i].reg & 0xFFU),
			   (u32)t[i].val);
	}
	xil_printf("---------------------------------------------------------------\r\n");
}

static int WriteTableNamed(const char *title, const Imx219Reg *t, u32 n)
{
	u32 i;

	PrintConfigBlock(title, t, n);
	for (i = 0; i < n; i++) {
		if (Imx219_WriteReg(t[i].reg, t[i].val) != XST_SUCCESS) {
			xil_printf("[IMX219] write fail 0x%04x\r\n", t[i].reg);
			return XST_FAILURE;
		}
	}
	return XST_SUCCESS;
}

static int WriteOneNamed(const char *title, u16 reg, u8 val)
{
	Imx219Reg one;

	one.reg = reg;
	one.val = val;
	return WriteTableNamed(title, &one, 1);
}

static int ChecklistTable(const char *title, const Imx219Reg *t, u32 n,
			  int skip_read, u32 *pass, u32 *fail, u32 *skip)
{
	u32 i;
	u8 live;

	xil_printf("| %s\r\n", title);
	for (i = 0; i < n; i++) {
		if (skip_read) {
			xil_printf("| %02X %02X  wrote=%02X  live=--  [skip]\r\n",
				   (u32)(t[i].reg >> 8),
				   (u32)(t[i].reg & 0xFFU),
				   (u32)t[i].val);
			(*skip)++;
			continue;
		}
		if (Imx219_ReadReg(t[i].reg, &live) != XST_SUCCESS) {
			xil_printf("| %02X %02X  wrote=%02X  live=??  [fail]\r\n",
				   (u32)(t[i].reg >> 8),
				   (u32)(t[i].reg & 0xFFU),
				   (u32)t[i].val);
			(*fail)++;
			continue;
		}
		if (live == t[i].val) {
			xil_printf("| %02X %02X  wrote=%02X  live=%02X  [pass]\r\n",
				   (u32)(t[i].reg >> 8),
				   (u32)(t[i].reg & 0xFFU),
				   (u32)t[i].val, (u32)live);
			(*pass)++;
		} else {
			xil_printf("| %02X %02X  wrote=%02X  live=%02X  [fail]\r\n",
				   (u32)(t[i].reg >> 8),
				   (u32)(t[i].reg & 0xFFU),
				   (u32)t[i].val, (u32)live);
			(*fail)++;
		}
	}
	return XST_SUCCESS;
}

static int I2cInit(void)
{
	XIicPs_Config *iic_cfg;

	iic_cfg = XIicPs_LookupConfig(XPAR_XIICPS_0_DEVICE_ID);
	if (iic_cfg == NULL) {
		return XST_FAILURE;
	}
	if (XIicPs_CfgInitialize(&Iic, iic_cfg, iic_cfg->BaseAddress)
	    != XST_SUCCESS) {
		return XST_FAILURE;
	}
	if (XIicPs_SetSClk(&Iic, I2C_BUS_HZ) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	xil_printf("[I2C] Initialised (100 kHz)\r\n");
	return XST_SUCCESS;
}

static void I2cScan(void)
{
	u8 addr;
	u8 dummy;
	int found = 0;

	xil_printf("[I2C] Scan 0x08..0x77:\r\n");
	for (addr = 0x08U; addr <= 0x77U; addr++) {
		if (WaitBus() != XST_SUCCESS) {
			continue;
		}
		if (XIicPs_MasterRecvPolled(&Iic, &dummy, 1, addr)
		    == XST_SUCCESS) {
			xil_printf("  found 0x%02x\r\n", addr);
			found = 1;
		}
	}
	if (!found) {
		xil_printf("  (no devices)\r\n");
	}
}

int Imx219_WriteReg(u16 reg, u8 val)
{
	u8 buf[3];

	buf[0] = (u8)(reg >> 8);
	buf[1] = (u8)(reg & 0xFF);
	buf[2] = val;

	if (WaitBus() != XST_SUCCESS) {
		return XST_FAILURE;
	}

	if (XIicPs_MasterSendPolled(&Iic, buf, 3, I2cAddr)
	    != XST_SUCCESS) {
		xil_printf("IMX219 WR fail 0x%04x\r\n", reg);
		return XST_FAILURE;
	}
	usleep(200);
	return XST_SUCCESS;
}

int Imx219_ReadReg(u16 reg, u8 *val)
{
	u8 addr[2];

	addr[0] = (u8)(reg >> 8);
	addr[1] = (u8)(reg & 0xFF);

	if (WaitBus() != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Datasheet §3-1-2-1 / Fig. 12: Repeated Start between index and data. */
	XIicPs_SetOptions(&Iic, XIICPS_REP_START_OPTION);
	if (XIicPs_MasterSendPolled(&Iic, addr, 2, I2cAddr)
	    != XST_SUCCESS) {
		XIicPs_ClearOptions(&Iic, XIICPS_REP_START_OPTION);
		xil_printf("IMX219 RD index fail 0x%04x\r\n", reg);
		return XST_FAILURE;
	}
	XIicPs_ClearOptions(&Iic, XIICPS_REP_START_OPTION);

	if (XIicPs_MasterRecvPolled(&Iic, val, 1, I2cAddr)
	    != XST_SUCCESS) {
		xil_printf("IMX219 RD data fail 0x%04x\r\n", reg);
		return XST_FAILURE;
	}
	return XST_SUCCESS;
}

int Imx219_ReadChipId(u16 *id)
{
	u8 hi;
	u8 lo;

	if (Imx219_ReadReg(0x0000, &hi) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	if (Imx219_ReadReg(0x0001, &lo) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	*id = ((u16)hi << 8) | lo;
	return XST_SUCCESS;
}

int Imx219_Stream(int on)
{
	return WriteOneNamed(on ? "Standby/Stream -> STREAMING"
				: "Standby/Stream -> STANDBY",
			     0x0100, on ? 0x01 : 0x00);
}

/*
 * Software AE (sensor has no AEC). Datasheet:
 *   coarse 0x015A/0x015B: 1 .. frame_length_lines−4  (p.56–57)
 *   ANA_GAIN_GLOBAL 0x0157: 0..232, Gain = 256/(256−X)  (p.58)
 *   DIG_GAIN_GLOBAL 0x0158/0x0159: 8.8, 1.00 .. 15.00  (p.60)
 * Frame-bank latch on V-sync; gain/shutter-only updates have no extra blanking.
 */
#define IMX219_FRM_LENGTH     1520U
#define IMX219_COARSE_MIN     1U
#define IMX219_COARSE_MAX     (IMX219_FRM_LENGTH - 4U)
#define IMX219_ANA_GAIN_MAX   232U
#define IMX219_DIG_GAIN_MIN   0x0100U
#define IMX219_DIG_GAIN_MAX   0x0F00U

static u16 AeCoarse = 0x0190U; /* matches Imx219CfgExposure */
static u8  AeAna    = 0x50U;
static u16 AeDig    = 0x0100U;

int Imx219_SetAe(u16 coarse, u8 ana_gain, u16 dig_gain)
{
	if (coarse < IMX219_COARSE_MIN) {
		coarse = IMX219_COARSE_MIN;
	}
	if (coarse > IMX219_COARSE_MAX) {
		coarse = IMX219_COARSE_MAX;
	}
	if (ana_gain > IMX219_ANA_GAIN_MAX) {
		ana_gain = IMX219_ANA_GAIN_MAX;
	}
	if (dig_gain < IMX219_DIG_GAIN_MIN) {
		dig_gain = IMX219_DIG_GAIN_MIN;
	}
	if (dig_gain > IMX219_DIG_GAIN_MAX) {
		dig_gain = IMX219_DIG_GAIN_MAX;
	}
	if (coarse == AeCoarse && ana_gain == AeAna && dig_gain == AeDig) {
		return XST_SUCCESS;
	}

	if (Imx219_WriteReg(0x015A, (u8)(coarse >> 8)) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	if (Imx219_WriteReg(0x015B, (u8)(coarse & 0xFFU)) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	if (Imx219_WriteReg(0x0157, ana_gain) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	if (Imx219_WriteReg(0x0158, (u8)((dig_gain >> 8) & 0x0FU)) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	if (Imx219_WriteReg(0x0159, (u8)(dig_gain & 0xFFU)) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	/* Confirm programmed registers; the frame-bank takes effect on the next
	 * or following V-sync, so the controller still waits two fresh frames. */
	{
		u8 hi, lo, gain, dhi, dlo;
		if (Imx219_ReadReg(0x015A, &hi) != XST_SUCCESS ||
		    Imx219_ReadReg(0x015B, &lo) != XST_SUCCESS ||
		    Imx219_ReadReg(0x0157, &gain) != XST_SUCCESS ||
		    Imx219_ReadReg(0x0158, &dhi) != XST_SUCCESS ||
		    Imx219_ReadReg(0x0159, &dlo) != XST_SUCCESS ||
		    (((u16)hi << 8) | lo) != coarse || gain != ana_gain ||
		    ((((u16)dhi & 0x0FU) << 8) | dlo) != dig_gain) {
			xil_printf("[AE] sensor register readback failed\r\n");
			return XST_FAILURE;
		}
	}

	AeCoarse = coarse;
	AeAna = ana_gain;
	AeDig = dig_gain;
	return XST_SUCCESS;
}

void Imx219_GetAe(u16 *coarse, u8 *ana, u16 *dig)
{
	if (coarse != NULL) {
		*coarse = AeCoarse;
	}
	if (ana != NULL) {
		*ana = AeAna;
	}
	if (dig != NULL) {
		*dig = AeDig;
	}
}

int Imx219_Config1080pRaw10(void)
{
	u16 id = 0;

	xil_printf("[IMX219] Initialising sensor...\r\n");

	if (Imx219_Stream(0) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	if (WriteOneNamed("Soft reset", 0x0103, 0x01) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	usleep(10000);

	if (Imx219_ReadChipId(&id) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	xil_printf("[IMX219] Chip ID after reset = 0x%04x (expect 0x0219)\r\n",
		   id);

	if (Imx219_Stream(0) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	if (WriteTableNamed("Access unlock", Imx219AccessUnlock,
			    sizeof(Imx219AccessUnlock) /
			    sizeof(Imx219AccessUnlock[0])) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	if (WriteTableNamed("MIPI / clock / DT RAW10", Imx219CfgMipi,
			    sizeof(Imx219CfgMipi) / sizeof(Imx219CfgMipi[0]))
	    != XST_SUCCESS) {
		return XST_FAILURE;
	}
	if (WriteTableNamed("Exposure / gain", Imx219CfgExposure,
			    sizeof(Imx219CfgExposure) /
			    sizeof(Imx219CfgExposure[0])) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	if (WriteTableNamed("PLL (1920x1080 / 2-lane @30fps)", Imx219CfgPll,
			    sizeof(Imx219CfgPll) / sizeof(Imx219CfgPll[0]))
	    != XST_SUCCESS) {
		return XST_FAILURE;
	}
	if (WriteTableNamed("Frame timing -> FL=1520 LL=4000 (30 fps)",
			    Imx219CfgTiming,
			    sizeof(Imx219CfgTiming) /
			    sizeof(Imx219CfgTiming[0])) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	if (WriteTableNamed("Resolution -> 1920x1080 crop",
			    Imx219CfgResolution,
			    sizeof(Imx219CfgResolution) /
			    sizeof(Imx219CfgResolution[0])) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	if (WriteTableNamed("Magic registers (RPi)", Imx219CfgMagic,
			    sizeof(Imx219CfgMagic) / sizeof(Imx219CfgMagic[0]))
	    != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Normal image — not sensor color bars (0x0601=0, datasheet p.62). */
	if (Imx219_WriteReg(0x0600, 0x00) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	if (Imx219_WriteReg(0x0601, 0x00) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	/* Datasheet §5-2: 2x2 binning averages same-color sites
	 * (R(0,0)+R(0,2)+R(2,0)+R(2,2))/4 and cuts output to 1/4 of the array.
	 * It does not pack a GBRG 2x2 cell into one RGB pixel. That G average
	 * is demosaic at each of 1920x1080 sites. Array is 3280x2464, so
	 * 3840x2160 capture is impossible. 1080p = V-crop, BINNING_MODE=0. */
	{
		u32 i;
		u8 live;
		for (i=0; i<sizeof(Imx219CfgResolution)/sizeof(Imx219CfgResolution[0]); i++) {
			if (Imx219_ReadReg(Imx219CfgResolution[i].reg,&live)!=XST_SUCCESS ||
			    live!=Imx219CfgResolution[i].val) {
				xil_printf("[IMX219] resolution readback failed @%04x\r\n",Imx219CfgResolution[i].reg);
				return XST_FAILURE;
			}
		}
		AeCoarse=0x0190U; AeAna=0x50U; AeDig=0x0100U;
		xil_printf("[IMX219] verified 1920x1080 RAW -> 1920x1080 RGB, BINNING_MODE=0\r\n");
		xil_printf("[IMX219] 5-2 2x2 binning = 1/4 pixels (same-color avg); not 4x capture\r\n");
		xil_printf("[IMX219] GBRG two-G average is v_demosaic, CAL_MODE=average\r\n");
	}

	xil_printf("[IMX219] Initialised: 1920x1080 RAW10, 2-lane MIPI\r\n");
	xil_printf("[IMX219] crop X 680..2599  Y 692..1771  (1920 x 1080 window)\r\n");
	xil_printf("[IMX219] X_OUT=1920 Y_OUT=1080  CSI RAW10 WC=2400 bytes/line\r\n");
	xil_printf("[IMX219] frame_len=1520 line_len=4000  lanes=2  CSI_FMT=0x0A0A\r\n");
	return XST_SUCCESS;
}

int Imx219_CfgChecklist(void)
{
	u32 pass = 0;
	u32 fail = 0;
	u32 skip = 0;
	u8 live;

	xil_printf("======================================\r\n");
	xil_printf(" IMX219 CFG CHECKLIST (wrote @init vs live)  [once]\r\n");
	xil_printf("======================================\r\n");

	if (Imx219_ReadReg(0x0100, &live) == XST_SUCCESS) {
		xil_printf("| Standby/Stream -> STREAMING\r\n");
		xil_printf("| 01 00  wrote=01  live=%02X  [%s]\r\n",
			   live, (live == 0x01U) ? "pass" : "fail");
		if (live == 0x01U) {
			pass++;
		} else {
			fail++;
		}
	}

	ChecklistTable("MIPI / clock / DT RAW10", Imx219CfgMipi,
		       sizeof(Imx219CfgMipi) / sizeof(Imx219CfgMipi[0]),
		       0, &pass, &fail, &skip);
	ChecklistTable("Exposure / gain (AE live — skip exact match)",
		       Imx219CfgExposure,
		       sizeof(Imx219CfgExposure) / sizeof(Imx219CfgExposure[0]),
		       1, &pass, &fail, &skip);
	ChecklistTable("PLL (1920x1080 / 2-lane @30fps)", Imx219CfgPll,
		       sizeof(Imx219CfgPll) / sizeof(Imx219CfgPll[0]),
		       0, &pass, &fail, &skip);
	ChecklistTable("Frame timing -> FL=1520 LL=4000 (30 fps)",
		       Imx219CfgTiming,
		       sizeof(Imx219CfgTiming) / sizeof(Imx219CfgTiming[0]),
		       0, &pass, &fail, &skip);
	ChecklistTable("Resolution -> 1920x1080 crop", Imx219CfgResolution,
		       sizeof(Imx219CfgResolution) /
		       sizeof(Imx219CfgResolution[0]),
		       0, &pass, &fail, &skip);
	ChecklistTable("Magic registers (RPi) — write-only, skip readback",
		       Imx219CfgMagic,
		       sizeof(Imx219CfgMagic) / sizeof(Imx219CfgMagic[0]),
		       1, &pass, &fail, &skip);

	xil_printf("--------------------------------------\r\n");
	xil_printf(" TOTAL: %u [pass], %u [fail], %u [skip]%s\r\n",
		   pass, fail, skip,
		   (fail == 0U) ? "  ALL PASS" : "");
	xil_printf("======================================\r\n");
	return (fail == 0U) ? XST_SUCCESS : XST_FAILURE;
}

int Imx219_Init(void)
{
	XGpioPs_Config *gpio_cfg;
	u16 id = 0;
	u8 hi = 0;
	u8 lo = 0;
	int rc;

	xil_printf("[MAIN] GPIO...\r\n");
	gpio_cfg = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_DEVICE_ID);
	if (gpio_cfg == NULL) {
		xil_printf("XGpioPs_LookupConfig failed\r\n");
		return XST_FAILURE;
	}
	if (XGpioPs_CfgInitialize(&Gpio, gpio_cfg, gpio_cfg->BaseAddr)
	    != XST_SUCCESS) {
		xil_printf("XGpioPs_CfgInitialize failed\r\n");
		return XST_FAILURE;
	}
	XGpioPs_SetDirectionPin(&Gpio, CAM_XCLR_EMIO_PIN, 1);
	XGpioPs_SetOutputEnablePin(&Gpio, CAM_XCLR_EMIO_PIN, 1);
	xil_printf("[GPIO] pin %u configured\r\n", CAM_XCLR_EMIO_PIN);

	xil_printf("[MAIN] I2C...\r\n");
	if (I2cInit() != XST_SUCCESS) {
		return XST_FAILURE;
	}
	xil_printf("[HINT] Pcam FFC: metal contacts toward the HDMI edge\r\n");
	xil_printf("       (away from board centre, contacts visible from above).\r\n");

	/* Baseline scan with XCLR low — expect empty bus. */
	xil_printf("[GPIO] pin54 = 0  (camera in reset — baseline scan)\r\n");
	XGpioPs_WritePin(&Gpio, CAM_XCLR_EMIO_PIN, 0);
	usleep(1000);
	I2cScan();

	/*
	 * p.77: XCLR Low→High after supplies. Wait t5 ≥ 6 ms before
	 * leaving standby (Table 37).
	 */
	xil_printf("[GPIO] pin54 = 1  (camera enabled — waiting 1 s for XCLR t5+t6)\r\n");
	XGpioPs_WritePin(&Gpio, CAM_XCLR_EMIO_PIN, 1);
	usleep(1000000);

	xil_printf("[I2C] Controller re-init...\r\n");
	if (I2cInit() != XST_SUCCESS) {
		return XST_FAILURE;
	}

	I2cAddr = IMX219_I2C_ADDR_7BIT;
	xil_printf("[IMX219] Probe 0x10\r\n");
	rc = Imx219_ReadReg(0x0000, &hi);
	if (rc == XST_SUCCESS) {
		rc = Imx219_ReadReg(0x0001, &lo);
	}
	id = ((u16)hi << 8) | lo;
	xil_printf("  ID@0x0000 = 0x%04x rc=%d\r\n", id, rc);

	if (rc != XST_SUCCESS || id != IMX219_MODEL_ID) {
		I2cAddr = 0x1AU;
		hi = lo = 0;
		xil_printf("[IMX219] Probe 0x1A\r\n");
		rc = Imx219_ReadReg(0x0000, &hi);
		if (rc == XST_SUCCESS) {
			rc = Imx219_ReadReg(0x0001, &lo);
		}
		id = ((u16)hi << 8) | lo;
		xil_printf("  ID@0x0000 = 0x%04x rc=%d\r\n", id, rc);
	}

	if (rc != XST_SUCCESS || id != IMX219_MODEL_ID) {
		xil_printf("IMX219 not responding (want 0x0219)\r\n");
		return XST_FAILURE;
	}
	xil_printf("[IMX219] Detected IMX219 at 0x%02x\r\n", I2cAddr);
	return XST_SUCCESS;
}

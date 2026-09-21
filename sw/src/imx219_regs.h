#ifndef IMX219_REGS_H
#define IMX219_REGS_H

#include "xil_types.h"

typedef struct {
	u16 reg;
	u8  val;
} Imx219Reg;

/* Manufacturer-specific unlock (RPi / Linux, map 0x3000–0x5FFF). */
static const Imx219Reg Imx219AccessUnlock[] = {
	{0x30EB, 0x05},
	{0x30EB, 0x0C},
	{0x300A, 0xFF},
	{0x300B, 0xFF},
	{0x30EB, 0x05},
	{0x30EB, 0x09},
};

/* CSI / clock / format — before leaving standby (datasheet p.28, p.47, p.49). */
static const Imx219Reg Imx219CfgMipi[] = {
	{0x0114, 0x01}, /* CSI_LANE_MODE 2-lane */
	{0x0128, 0x00}, /* DPHY auto timing */
	{0x012A, 0x18}, /* EXCK_FREQ = 24.00 MHz */
	{0x012B, 0x00},
	{0x018C, 0x0A}, /* CSI_DATA_FORMAT RAW10 → DT 0x2B */
	{0x018D, 0x0A},
};

static const Imx219Reg Imx219CfgExposure[] = {
	{0x015A, 0x01}, /* COARSE_INTEGRATION_TIME = 400 */
	{0x015B, 0x90},
	{0x0157, 0x50}, /* ANA_GAIN_GLOBAL */
	{0x0158, 0x01}, /* DIG_GAIN_GLOBAL = 1.00 */
	{0x0159, 0x00},
};

/*
 * PLL + frame timing for 1920×1080 / 2-lane @ ~30 fps (RPi 1080p30 class).
 * FRM_LENGTH=1520, LINE_LENGTH=4000: 182400000 / (1520 * 4000) = 30 fps.
 * Datasheet p.56: line time = LINE_LENGTH / (2 * VT pixel clock). Longer lines give the 100 MHz capture path time to drain (87.552 Mpixel/s during active rows).
 */
static const Imx219Reg Imx219CfgPll[] = {
	{0x0301, 0x05}, /* VTPXCK_DIV */
	{0x0303, 0x01}, /* VTSYCK_DIV */
	{0x0304, 0x03}, /* PREPLLCK_VT_DIV  24–27 MHz (Table 39) */
	{0x0305, 0x03},
	{0x0306, 0x00}, /* PLL_VT_MPY = 57 */
	{0x0307, 0x39},
	{0x0309, 0x0A}, /* OPPXCK_DIV */
	{0x030B, 0x01}, /* OPSYCK_DIV */
	{0x030C, 0x00}, /* PLL_OP_MPY = 114 */
	{0x030D, 0x72},
};

static const Imx219Reg Imx219CfgTiming[] = {
	{0x0160, 0x05}, /* FRM_LENGTH = 1520 */
	{0x0161, 0xF0},
	{0x0162, 0x0F}, /* LINE_LENGTH = 4000 */
	{0x0163, 0xA0},
};

/* Crop X 680..2599  Y 692..1771 → 1920×1080, binning off, Bayer GBRG (p.89). */
static const Imx219Reg Imx219CfgResolution[] = {
	{0x0164, 0x02}, /* X_ADD_STA = 680 */
	{0x0165, 0xA8},
	{0x0166, 0x0A}, /* X_ADD_END = 2599 */
	{0x0167, 0x27},
	{0x0168, 0x02}, /* Y_ADD_STA = 692 */
	{0x0169, 0xB4},
	{0x016A, 0x06}, /* Y_ADD_END = 1771 */
	{0x016B, 0xEB},
	{0x016C, 0x07}, /* x_output_size = 1920 */
	{0x016D, 0x80},
	{0x016E, 0x04}, /* y_output_size = 1080 */
	{0x016F, 0x38},
	{0x0624, 0x07}, /* output / TP window size */
	{0x0625, 0x80},
	{0x0626, 0x04},
	{0x0627, 0x38},
	{0x0170, 0x01},
	{0x0171, 0x01},
	{0x0172, 0x00}, /* orientation 0 → Bayer GBRG */
	{0x0174, 0x00}, /* BINNING_MODE H = no-binning (p.53: 1080p is V-crop) */
	{0x0175, 0x00}, /* BINNING_MODE V = no-binning */
	{0x0176, 0x00}, /* BINNING_CAL_MODE H = average (not sum) */
	{0x0177, 0x00}, /* BINNING_CAL_MODE V = average (not sum) */
};

/* RPi magic (write-only in practice). */
static const Imx219Reg Imx219CfgMagic[] = {
	{0x455E, 0x00},
	{0x471E, 0x4B},
	{0x4767, 0x0F},
	{0x4750, 0x14},
	{0x4540, 0x00},
	{0x47B4, 0x14},
	{0x4713, 0x30},
	{0x478B, 0x10},
	{0x478F, 0x10},
	{0x4793, 0x10},
	{0x4797, 0x0E},
	{0x479B, 0x0E},
};

#endif

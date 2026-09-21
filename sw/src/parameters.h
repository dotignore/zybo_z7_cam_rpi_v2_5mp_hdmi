#ifndef PARAMETERS_H
#define PARAMETERS_H

#include "xparameters.h"

/*
 * Адреса / ID IP появляются в xparameters.h после Export Hardware (.xsa).
 * Имена в Vivado 2025.2 / Vitis Unified иногда отличаются — поправьте здесь.
 */

#ifndef XPAR_XIICPS_0_DEVICE_ID
#ifdef XPAR_PS7_I2C_0_DEVICE_ID
#define XPAR_XIICPS_0_DEVICE_ID XPAR_PS7_I2C_0_DEVICE_ID
#endif
#endif

#ifndef XPAR_XGPIOPS_0_DEVICE_ID
#ifdef XPAR_PS7_GPIO_0_DEVICE_ID
#define XPAR_XGPIOPS_0_DEVICE_ID XPAR_PS7_GPIO_0_DEVICE_ID
#endif
#endif

#ifndef XPAR_AXIVDMA_0_DEVICE_ID
#ifdef XPAR_AXI_VDMA_0_DEVICE_ID
#define XPAR_AXIVDMA_0_DEVICE_ID XPAR_AXI_VDMA_0_DEVICE_ID
#endif
#endif

#ifndef XPAR_CSISS_0_DEVICE_ID
#ifdef XPAR_MIPI_CSI2_RX_SUBSYST_0_DEVICE_ID
#define XPAR_CSISS_0_DEVICE_ID XPAR_MIPI_CSI2_RX_SUBSYST_0_DEVICE_ID
#elif defined(XPAR_XCSISS_0_DEVICE_ID)
#define XPAR_CSISS_0_DEVICE_ID XPAR_XCSISS_0_DEVICE_ID
#endif
#endif

#ifndef XPAR_VTC_0_DEVICE_ID
#ifdef XPAR_V_TC_0_DEVICE_ID
#define XPAR_VTC_0_DEVICE_ID XPAR_V_TC_0_DEVICE_ID
#elif defined(XPAR_XVTC_0_DEVICE_ID)
#define XPAR_VTC_0_DEVICE_ID XPAR_XVTC_0_DEVICE_ID
#endif
#endif

#ifndef XPAR_DEMOSAIC_0_DEVICE_ID
#ifdef XPAR_V_DEMOSAIC_0_DEVICE_ID
#define XPAR_DEMOSAIC_0_DEVICE_ID XPAR_V_DEMOSAIC_0_DEVICE_ID
#elif defined(XPAR_XV_DEMOSAIC_0_DEVICE_ID)
#define XPAR_DEMOSAIC_0_DEVICE_ID XPAR_XV_DEMOSAIC_0_DEVICE_ID
#endif
#endif

/* IMX219 — даташит p.17–28, p.47, p.89 */
#define IMX219_I2C_ADDR_7BIT    0x10U   /* alt 0x1A */
#define IMX219_MODEL_ID         0x0219U
#define I2C_BUS_HZ              100000U /* CCI; 400 kHz тоже допустим */

/*
 * Zynq-7000: MIO 0..53, EMIO начинается с 54.
 * В BD GPIO EMIO width = 1 → XCLR камеры = GPIO_0[0] = pin 54 (XDC: G20).
 */
#define CAM_XCLR_EMIO_PIN       54U

#define VIDEO_COLUMNS           1920U
#define VIDEO_ROWS              1080U
#define VIDEO_BPP               3U      /* GBR888 after ISP / HDMI pack */
#define VIDEO_STRIDE            (VIDEO_COLUMNS * VIDEO_BPP) /* 5760 */
#define VIDEO_FRAME_LEN         (VIDEO_STRIDE * VIDEO_ROWS) /* 6220800 */
#define VIDEO_NUM_FRAMES        5U

/*
 * HDMI/DDR contract (rgb2dvi RBG + UG934 24-bit RGB):
 *   DDR bytes: G, B, R
 *   TDATA[23:0] = {R, B, G}
 *   red   = (R<<16)|(B<<8)|G as a 24-bit word
 */
#define PIXEL_G_OFF             0U
#define PIXEL_B_OFF             1U
#define PIXEL_R_OFF             2U

/*
 * Five live frames at 0x01000000..0x02DFFFFF. Dedicated test frame at
 * 0x03000000, RAW16 source at 0x04000000..0x043F47FF.
 * Program, heap and stack are restricted by the linker to <0x01000000.
 */
#define FRAMEBUF_BASE           0x01000000U
#define FRAMEBUF_STRIDE_BYTES   0x00600000U
#define FRAMEBUF_ADDR(i)        (FRAMEBUF_BASE + ((u32)(i) * FRAMEBUF_STRIDE_BYTES))
#define TEST_FRAME_ADDR         0x03000000U
#define RAW_FRAME_ADDR          0x04000000U
#define RAW_MAGIC_ADDR          0x04400000U
#define RAW_MAGIC_VALUE         0x52415732U
#define RAW_VDMA_BASE           0x43010000U
#define RAW_SWITCH_BASE         0x43C30000U
#define BAYER_PHASE_GPIO_BASE   0x43C40000U
#define TEST_FRAME_STORE        4U
#define TEST_MAGIC_ADDR         0x02E00000U
#define TEST_MAGIC_GBR1         0x47425231U

/* v_demosaic PG286 BAYER_PHASE: 0=RGGB 1=GRBG 2=GBRG 3=BGGR. Даташит p.89 = GBRG.
 * Change DEMOSAIC_BAYER_PHASE and run flash.cmd (no FPGA rebuild after the first). */
#define DEMOSAIC_BAYER_RGGB     0U
#define DEMOSAIC_BAYER_GRBG     1U
#define DEMOSAIC_BAYER_GBRG     2U
#define DEMOSAIC_BAYER_BGGR     3U
#define DEMOSAIC_BAYER_PHASE    DEMOSAIC_BAYER_RGGB
#if DEMOSAIC_BAYER_PHASE > 3U
#error DEMOSAIC_BAYER_PHASE must be 0..3
#endif

/* CSI tdata[9:2] 8-bit path: datasheet RAW10 black=64 → 16 after >>2. */
#define SENSOR_BLACK_8          16U

/* Auto-brightness knobs: sw/src/auto_exposure.h
 *   AE_TARGET_8BIT  — Rec.601 luma 0..255 (lower = darker picture)
 *   AE_MAX_DGAIN    — digital gain cap (0x0100=1x, 0x0400=4x)
 * Loop: pipeline.c AutoBright(). Sensor has no on-chip AEC. */

#define CSI_ACTIVE_LANES        2U

#endif /* PARAMETERS_H */

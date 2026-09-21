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
 * Ring of 5 GBR888 frames in DDR. Step 6 MiB (>= VIDEO_FRAME_LEN).
 * Linker DDR window: 0x00100000 .. 0x0FFFFFFF (lscript.ld).
 * Live pool 0x01000000 .. 0x02DFFFFF; test GBR uses store 4 @ 0x02800000.
 * Magic after the pool (gap, not displayed): 0x02E00000 = 'GBR1' if JTAG-loaded.
 */
#define FRAMEBUF_BASE           0x01000000U
#define FRAMEBUF_STRIDE_BYTES   0x00600000U
#define FRAMEBUF_ADDR(i)        (FRAMEBUF_BASE + ((u32)(i) * FRAMEBUF_STRIDE_BYTES))
#define TEST_FRAME_STORE        4U
#define TEST_MAGIC_ADDR         0x02E00000U
#define TEST_MAGIC_GBR1         0x47425231U

/* v_demosaic PG286: 0=RGGB 1=GRBG 2=GBRG 3=BGGR. Даташит p.89 = GBRG. */
#define DEMOSAIC_BAYER_GBRG     2U

/* CSI tdata[9:2] 8-bit path: datasheet RAW10 black=64 → 16 after >>2. */
#define SENSOR_BLACK_8          16U

#define CSI_ACTIVE_LANES        2U

#endif /* PARAMETERS_H */

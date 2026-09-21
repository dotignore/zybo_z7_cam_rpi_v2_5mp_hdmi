#ifndef AUTO_EXPOSURE_H
#define AUTO_EXPOSURE_H
#include <stdint.h>
/*
 * Live HDMI is linear GBR888 (RAW10 >> 2), not sRGB.
 * Target is Rec.601 8-bit luma in the centre ROI, stored as Q12 (code*16).
 * Lower AE_TARGET_8BIT if the picture is too bright; raise if too dark.
 */
#define AE_TARGET_8BIT 80U
#define AE_TARGET_Q12 (AE_TARGET_8BIT * 16U)
#define AE_MIN_LINES 8U
#define AE_MAX_LINES 1516U
#define AE_MAX_GAIN_CODE 232U
/* Datasheet p.60 allows 15.00x; 4.00x is enough without blasting the screen. */
#define AE_MIN_DGAIN 0x0100U
#define AE_MAX_DGAIN 0x0400U
typedef struct {
	uint16_t lines;
	uint8_t gain;
	uint16_t dgain;
} AeSetting;
AeSetting Ae_Next(AeSetting current, uint32_t mean_q12,
		  uint32_t clipped, uint32_t samples);
#endif

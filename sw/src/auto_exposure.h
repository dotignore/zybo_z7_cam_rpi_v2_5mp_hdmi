#ifndef AUTO_EXPOSURE_H
#define AUTO_EXPOSURE_H
#include <stdint.h>
/* Mean linear-light target 18% after nominal black removal, Q12. */
#define AE_TARGET_Q12 737U
#define AE_MIN_LINES 8U
#define AE_MAX_LINES 1516U
#define AE_MAX_GAIN_CODE 232U
typedef struct { uint16_t lines; uint8_t gain; } AeSetting;
AeSetting Ae_Next(AeSetting current, uint32_t mean_q12,
                  uint32_t clipped, uint32_t samples);
#endif

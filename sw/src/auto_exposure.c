#include "auto_exposure.h"

AeSetting Ae_Next(AeSetting c, uint32_t mean, uint32_t clipped, uint32_t samples)
{
    uint32_t ratio, budget, next, lines, divisor;
    AeSetting out = c;
    if (!samples) return c;
    if (mean >= AE_TARGET_Q12-65 && mean <= AE_TARGET_Q12+65 &&
        clipped * 20U <= samples) return c;
    if (!mean) mean = 1;
    /* ligfile: luma=1 crawled 25%/step for seconds. Jump to the datasheet
     * FL-4 / analogue-gain limit instead of a 4x crawl. */
    if (mean * 16U < AE_TARGET_Q12) {
        out.lines = AE_MAX_LINES;
        out.gain = AE_MAX_GAIN_CODE;
        return out;
    }
    ratio = AE_TARGET_Q12 * 256U / mean;
    /* Clamp remaining lighting changes to 0.25..8x; damp small corrections. */
    if (ratio > 2048U) ratio = 2048U;
    if (ratio < 64U) ratio = 64U;
    if (ratio > 128U && ratio < 512U) ratio = (ratio + 256U) / 2U;
    if (clipped * 20U > samples && ratio > 192U) ratio = 192U;
    if (c.gain > AE_MAX_GAIN_CODE) c.gain = AE_MAX_GAIN_CODE;
    /* Sensor gain is 256/(256-code), NOT linear in the register code. */
    budget = (uint32_t)c.lines * 65536U / (256U-c.gain); // lines * gain, Q8
    next = (budget * ratio + 128U) / 256U;
    if (next < AE_MIN_LINES*256U) next = AE_MIN_LINES*256U;
    if (next > AE_MAX_LINES*65536U/24U) next = AE_MAX_LINES*65536U/24U;
    lines = (next + 128U)/256U;
    if (lines > AE_MAX_LINES) lines = AE_MAX_LINES;
    divisor = (lines*65536U + next/2U)/next;
    if (divisor > 256U) divisor = 256U;
    if (divisor < 24U) divisor = 24U;
    out.lines = (uint16_t)lines;
    out.gain = (uint8_t)(256U-divisor);
    return out;
}

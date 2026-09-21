#include "auto_exposure.h"

/* Analogue Q8 (256 = 1.00x): 65536/(256-code). Max code 232 → 2730. */
#define AE_ANA_Q8_MAX (65536U / (256U - AE_MAX_GAIN_CODE))

static uint32_t ae_ana_q8(uint8_t gain)
{
	if (gain > AE_MAX_GAIN_CODE) {
		gain = AE_MAX_GAIN_CODE;
	}
	return 65536U / (256U - gain);
}

static uint32_t ae_light(AeSetting s)
{
	uint16_t dgain = s.dgain;

	if (dgain < AE_MIN_DGAIN) {
		dgain = AE_MIN_DGAIN;
	}
	return (uint32_t)((uint64_t)s.lines * ae_ana_q8(s.gain) * dgain / 256U);
}

/* Shutter first, then analogue gain, then digital gain (datasheet p.56–60). */
static AeSetting ae_from_light(uint32_t light)
{
	AeSetting out;
	uint32_t product_q8;
	uint32_t div;
	uint32_t dgain;

	if (light < AE_MIN_LINES * 256U) {
		light = AE_MIN_LINES * 256U;
	}

	if (light <= AE_MAX_LINES * 256U) {
		out.lines = (uint16_t)((light + 128U) / 256U);
		if (out.lines < AE_MIN_LINES) {
			out.lines = AE_MIN_LINES;
		}
		out.gain = 0;
		out.dgain = AE_MIN_DGAIN;
		return out;
	}

	out.lines = AE_MAX_LINES;
	product_q8 = (uint32_t)(((uint64_t)light * 256U) / AE_MAX_LINES);
	if (product_q8 <= AE_ANA_Q8_MAX) {
		div = 65536U / product_q8;
		if (div > 256U) {
			div = 256U;
		}
		if (div < 24U) {
			div = 24U;
		}
		out.gain = (uint8_t)(256U - div);
		out.dgain = AE_MIN_DGAIN;
		return out;
	}

	out.gain = AE_MAX_GAIN_CODE;
	dgain = (uint32_t)(((uint64_t)product_q8 * 256U) / AE_ANA_Q8_MAX);
	if (dgain < AE_MIN_DGAIN) {
		dgain = AE_MIN_DGAIN;
	}
	if (dgain > AE_MAX_DGAIN) {
		dgain = AE_MAX_DGAIN;
	}
	out.dgain = (uint16_t)dgain;
	return out;
}

AeSetting Ae_Next(AeSetting c, uint32_t mean, uint32_t clipped, uint32_t samples)
{
	uint32_t ratio;
	uint32_t budget;
	uint32_t next;
	uint32_t max_light;

	if (c.dgain < AE_MIN_DGAIN) {
		c.dgain = AE_MIN_DGAIN;
	}
	if (c.dgain > AE_MAX_DGAIN) {
		c.dgain = AE_MAX_DGAIN;
	}
	if (c.gain > AE_MAX_GAIN_CODE) {
		c.gain = AE_MAX_GAIN_CODE;
	}

	if (!samples) {
		return c;
	}
	if (mean >= AE_TARGET_Q12 - 65U && mean <= AE_TARGET_Q12 + 65U &&
	    clipped * 20U <= samples) {
		return c;
	}
	if (!mean) {
		mean = 1;
	}

	ratio = AE_TARGET_Q12 * 256U / mean;
	/* At most 4x per step so AE tracks lighting instead of slamming. */
	if (ratio > 1024U) {
		ratio = 1024U;
	}
	if (ratio < 64U) {
		ratio = 64U;
	}
	if (ratio > 128U && ratio < 512U) {
		ratio = (ratio + 256U) / 2U;
	}
	if (clipped * 20U > samples && ratio > 192U) {
		ratio = 192U;
	}

	{
		AeSetting peak;

		peak.lines = AE_MAX_LINES;
		peak.gain = AE_MAX_GAIN_CODE;
		peak.dgain = AE_MAX_DGAIN;
		budget = ae_light(c);
		next = (uint32_t)(((uint64_t)budget * ratio + 128U) / 256U);
		max_light = ae_light(peak);
		if (next > max_light) {
			next = max_light;
		}
	}
	return ae_from_light(next);
}

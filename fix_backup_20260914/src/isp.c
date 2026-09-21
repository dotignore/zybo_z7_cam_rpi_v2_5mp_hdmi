/*
 * 8-bit ISP after v_demosaic: BLC, stretch, sRGB, pack GBR for rgb2dvi.
 * Demosaic AXIS is treated as R,G,B in TDATA[7:0],[15:8],[23:16] (HLS val[0..2]).
 * rgb2dvi wants G,B,R in those same byte lanes.
 */

#include "isp.h"
#include "parameters.h"
#include "srgb_lut.h"

void Isp_ProcessDemosaicToGbr(u8 *frame)
{
	u32 n;
	u8 *p;
	u8 r;
	u8 g;
	u8 b;

	p = frame;
	n = VIDEO_FRAME_LEN;
	while (n >= 3U) {
		r = p[0];
		g = p[1];
		b = p[2];
		p[PIXEL_G_OFF] = IspLut8[g];
		p[PIXEL_B_OFF] = IspLut8[b];
		p[PIXEL_R_OFF] = IspLut8[r];
		p += 3;
		n -= 3U;
	}
}

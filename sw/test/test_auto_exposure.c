#include "auto_exposure.h"
#include <assert.h>
#include <stdio.h>

static double exposure(AeSetting s)
{
    return s.lines * 256.0 / (256 - s.gain) * s.dgain / 256.0;
}
static void converge(double light, AeSetting start)
{
    int k;
    AeSetting s=start;
    for(k=0;k<20;k++) {
        double y=light*exposure(s);
        unsigned m=y>4095?4095:(unsigned)y;
        s=Ae_Next(s,m,y>=4095?3600:0,3600);
        assert(s.lines>=8 && s.lines<=1516 && s.gain<=232);
        assert(s.dgain>=AE_MIN_DGAIN && s.dgain<=AE_MAX_DGAIN);
    }
    double y=light*exposure(s);
    assert(y>=AE_TARGET_Q12-120 && y<=AE_TARGET_Q12+120);
}
int main(void)
{
    AeSetting initial={400,80,AE_MIN_DGAIN}, max={1516,232,AE_MAX_DGAIN};
    AeSetting min={8,0,AE_MIN_DGAIN}, s;
    converge(.08,initial);
    converge(12.0,max);
    converge(1.2,min);
    s=Ae_Next(max,0,0,3600);
    assert(s.lines==1516 && s.gain==232 && s.dgain==AE_MAX_DGAIN);
    s=Ae_Next(min,4095,3600,3600);
    assert(s.lines==8 && s.gain==0 && s.dgain==AE_MIN_DGAIN);
    s=Ae_Next(initial,AE_TARGET_Q12,0,3600);
    assert(s.lines==400 && s.gain==80 && s.dgain==AE_MIN_DGAIN);
    s=Ae_Next(initial,0,0,0); assert(s.lines==400 && s.gain==80);
    s=Ae_Next(initial,AE_TARGET_Q12-200,1000,3600);
    assert(exposure(s)<exposure(initial));
    puts("PASS AE: dark/bright convergence, saturation, boundaries, deadband");
    return 0;
}

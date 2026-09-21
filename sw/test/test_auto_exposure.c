#include "auto_exposure.h"
#include <assert.h>
#include <stdio.h>

static double exposure(AeSetting s) { return s.lines*256.0/(256-s.gain); }
static void converge(double light, AeSetting start)
{
    int k;
    AeSetting s=start;
    for(k=0;k<15;k++) {
        double y=light*exposure(s);
        unsigned m=y>4095?4095:(unsigned)y;
        s=Ae_Next(s,m,y>=4095?3600:0,3600);
        assert(s.lines>=8 && s.lines<=1516 && s.gain<=232);
    }
    double y=light*exposure(s);
    assert(y>=AE_TARGET_Q12-100 && y<=AE_TARGET_Q12+100);
}
int main(void)
{
    AeSetting initial={400,80}, max={1516,232}, min={8,0}, s;
    converge(.08,initial); // very dark -> high exposure
    converge(12.0,max);   // sudden bright light from max gain
    converge(1.2,min);
    s=Ae_Next(max,0,0,3600); assert(s.lines==1516 && s.gain==232);
    s=Ae_Next(initial,1,0,3600); assert(s.lines==1516 && s.gain==232);
    s=Ae_Next(min,4095,3600,3600); assert(s.lines==8 && s.gain==0);
    s=Ae_Next(initial,737,0,3600); assert(s.lines==400 && s.gain==80);
    s=Ae_Next(initial,0,0,0); assert(s.lines==400 && s.gain==80);
    s=Ae_Next(initial,600,1000,3600); assert(exposure(s)<exposure(initial));
    puts("PASS AE: dark/bright convergence, saturation, boundaries, deadband");
    return 0;
}

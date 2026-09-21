#ifndef PIPELINE_H
#define PIPELINE_H

#include "xil_types.h"

int Pipeline_Start(void);
void Pipeline_DumpStatus(void);
void Pipeline_Service(void);
void Pipeline_DumpFrameSample(void);
u32 Pipeline_LastCompleteFrame(void);

#endif

#ifndef IMX219_H
#define IMX219_H

#include "xil_types.h"

int Imx219_Init(void);
int Imx219_WriteReg(u16 reg, u8 val);
int Imx219_ReadReg(u16 reg, u8 *val);
int Imx219_ReadChipId(u16 *id);
int Imx219_Config1080pRaw10(void);
int Imx219_Stream(int on);
int Imx219_SetAe(u16 coarse, u8 ana_gain, u16 dig_gain);
void Imx219_GetAe(u16 *coarse, u8 *ana, u16 *dig);
int Imx219_CfgChecklist(void);

#endif

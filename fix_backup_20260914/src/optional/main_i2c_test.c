/*
 * Только проверка I2C / chip id. Компилировать ВМЕСТО main.c
 * на текущем bitstream (без HDMI IP).
 *
 * В Vitis: удалите main.c из приложения и добавьте этот файл.
 */

#include "xil_printf.h"
#include "imx219.h"

int main(void)
{
	u16 id;

	xil_printf("\r\nIMX219 I2C probe\r\n");
	if (Imx219_Init() != 0) {
		return 1;
	}
	if (Imx219_ReadChipId(&id) != 0) {
		return 1;
	}
	xil_printf("MODEL_ID = 0x%04x (expect 0x0219)\r\n", id);
	return 0;
}

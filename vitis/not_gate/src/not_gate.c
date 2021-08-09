

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xgpio.h"
#include "xparameters.h"

#define OUTPUT 0
#define INPUT 1

int main() {
	init_platform();

	XGpio input, output;

	// Initialize the input and output
	XGpio_Initialize(&input, XPAR_AXI_GPIO_0_DEVICE_ID);
	XGpio_Initialize(&output, XPAR_AXI_GPIO_1_DEVICE_ID);

	// Set data direction
	XGpio_SetDataDirection(&input, 1, INPUT);
	XGpio_SetDataDirection(&output, 1, OUTPUT);

	print("Initialized\r\n");

	// Main loop
	while (1) {
		if (XGpio_DiscreteRead(&input, 1) == 1) {
			XGpio_DiscreteWrite(&output, 1, 0);
			print("Input 1\r\n");
		} else {
			XGpio_DiscreteWrite(&output, 1, 1);
			print("Input 0\r\n");
		}
	}

	cleanup_platform();
	return 0;
}

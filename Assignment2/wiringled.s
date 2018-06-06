@==========================
@ Homework 2
@ wiringLED
@ Date: 2018. 5. 28
@ Developer: Junhyuck Woo
@ Reference
@ - pin number = GPIO 18
@==========================

@ External function
.extern printf
.extern wiringPiSetupGpio
.extern pinMode
.extern digitalWrite
.extern delay

.data
	@ String
	intro: .asciz "Raspberry Pi - LED Blink\n"
	ON: .asciz "ON\n"
	OFF: .asciz "OFF\n"

	@ Data
	LED: .word 18 @ For LED #define LED 18

.text
.global main

.func main
main:
	@ Print introduction
	@ printf("Raspberry Pi - LED Blink\n");
	LDR R0, =intro 
	BL printf
	
	@ Call wiringPiSetupGpio fuction
	@ wiringPiSetupGpio();
	BL wiringPiSetupGpio


	@ Set pinMode
	@ LED = 18, register r0
	@ OUTPUT = 1, register r1
	@ pinMode(LED, OUTPUT);
	ldr r0, =LED
	ldr r0, [r0]
	mov r1, #1
	BL pinMode

	@ LED Turn ON / OFF loop
	BL loop

end:
	MOV R7, #1
	SWI 0
.endfunc

@ loop for LED turn on / off
loop:
	@ Turn on LED	
	@ Call digitalWrite Function
	@ digitalWrite(LED, 1);
	ldr r0, =LED
	ldr r0, [r0]
	mov r1, #1
	BL digitalWrite

	@ Print LED Status
	@ printf("ON\n");
	ldr r0, =ON
	BL printf

	@ Delay 0.5 sec
	@ delay(500);
	mov r0, #500
	BL delay

	@ Turn off LED	
	@ Call digitalWrite Function
	@ digitalWrite(LED, 0);
	ldr r0, =LED
	ldr r0, [r0]
	mov r1, #0
	BL digitalWrite

	@ Print LED Status
	@ printf("OFF\n");
	ldr r0, =OFF
	BL printf

	@ Delay 0.5 sec
	@ delay(500);
	mov r0, #500
	BL delay

	BAL loop

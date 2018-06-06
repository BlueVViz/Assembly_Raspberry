@==========================
@ Homework 2
@ wiringSwitch
@ Date: 2018. 5. 28
@ Developer: Junhyuck Woo
@ Reference
@ - pin number = GPIO 18
@ - pin number = GPIO 23
@==========================

@ External function
.extern printf
.extern wiringPiSetupGpio
.extern pinMode
.extern digitalRead
.extern digitalWrite
.extern delay

.data
	@ String
	intro: .asciz "Raspberry Pi - Key Input Test\n"
	alarm: .asciz "Key is pressed\n"
	
	@ Data
	KEY: .word 23 @ For switch #define KEY 23
	LED: .word 18 @ For LED #define LED 18

.text
.global main

.func main
main:
	@ Print introduction
	@ printf("Raspberry Pi - Key Input Test\n");
	LDR R0, =intro 
	BL printf
	
	@ Call wiringPiSetupGpio fuction
	@ wiringPiSetupGpio();
	BL wiringPiSetupGpio


	@ Set pinMode
	@ KEY = 23, register r0
	@ INPUT = 0, register r1
	@ pinMode(KEY, INPUT);
	ldr r0, =KEY
	ldr r0, [r0]
	mov r1, #0
	BL pinMode

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

@ loop for print alarm,
@ when using switch
loop:
	
	@ Read digital signal from Pin(23)
	@ Call digitalRead function
	@ val = digitalRead(KEY);
	ldr r0, =KEY
	ldr r0, [r0]
	BL digitalRead

	@ Return value is saved in R0
	@ if(val == LOW)
	cmp r0, #0
	bne else

	@ if value is Low, Print alarm
	@ printf("Key is pressed\n");
	ldr r0, =alarm
	BL printf
	
	@ Turn on LED	
	@ Call digitalWrite Function
	@ digitalWrite(LED, 1);
	ldr r0, =LED
	ldr r0, [r0]
	mov r1, #1
	BL digitalWrite
	
	BAL loop

else:
	@ else
	@ Turn off LED	
	@ Call digitalWrite Function
	@ digitalWrite(LED, 0);
	ldr r0, =LED
	ldr r0, [r0]
	mov r1, #0
	BL digitalWrite

	@ Delay 0.01 sec
	@ delay(10);
	mov r0, #10
	BL delay

	BAL loop

@==========================
@ Homework 2
@ wiringint
@ Date: 2018. 5. 29
@ Developer: Junhyuck Woo
@ Reference
@ - pin number = GPIO 23
@==========================

@ External function
.extern printf
.extern wiringPiSetupGpio
.extern pinMode
.extern wiringPiISR
.extern delay

.data
	@ String
	alarm: .asciz "Key is pressed\n"
	lapse: .asciz "%d sec. \n"
	
	@ Data
	KEY: .word 23 @ For switch #define KEY 23

	@ value for second
	val: .word 0
	add: .word isr_key

.text
.global main
.global isr_key

.func main
main:
	
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

	@ SetInteruptFunction
	@ wiringPiISR(KEY, INT_EDGE_FALLING,isr_key);
	ldr r0, =KEY
	ldr r0, [r0]
	mov r1, #1
	ldr r2, =isr_key
	BL wiringPiISR

	@ LED Turn ON / OFF loop
	BL loop

end:
	MOV R7, #1
	SWI 0
.endfunc


@ loop for isr_key
.func isr_key
isr_key:
	
	push {lr}
	
	@ Print Alarm
	@ printf("Key is pressed\n");
	ldr r0, =alarm
	BL printf
	
	pop {pc}
.endfunc


@ loop count second
loop:
	@ Print seccond
	@ printf("%d sec. \n", sec);
	ldr r0, =lapse
	ldr r1, =val
	ldr r1, [r1]
	BL printf

	@ increase val second
	@ sec+1;
	ldr r0, =val
	ldr r1, [r0]
	ADD r1, r1, #1
	
	@ Store val second
	@ sec = sec+1;
	str r1, [r0]

	@ Delay 1 sec
	@ delay(1000);
	mov r0, #1000
	BL delay

	BAL loop

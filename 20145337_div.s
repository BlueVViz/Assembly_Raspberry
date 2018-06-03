@=========================
@ Division Function
@ Date: 2018. 04. 21
@ Creator: Junhyuck Woo
@========================

@ External Function
.extern printf
.extern scanf

@ Data set
.data
	@ String
	intro: .asciz "Enter Two integers(A / B): "
	err1: .asciz "Can't divide 0\n"
	output: .asciz "Quat: %d \nRemaind: %d\n"
	input: .asciz "%d%d"
	
	@ Variable
	num1: .word 0
	num2: .word 0

@ User program
.text
.global main

.func main
main: @ main function
	@ Print Introduction
	LDR R0, =intro
	BL printf

	@ Get two integers
	LDR R0, =input
	LDR R1, =num1
	LDR R2, =num2
	BL scanf
	
	@@ Give R0 R1 as function parameter
	@ Load data to R0, R1
	LDR R0, =num1           @ R0 = &num1
	LDR R0, [R0]            @ R0 = mem[R0]
	LDR R1, =num2           @ R1 = &num2
	LDR R1, [R1]            @ R1 = mem[R1]

	@ Call division function
	BL div                  @div()

print: @ Print result
	MOV R2, R1              @ R2 = R1
	MOV R1, R0              @ R1 = R0
	LDR R0, =output         @ R0 = &output
	BL printf               @ printf(R0, R1, R2)
                                @ => printf("Qout: %d \nRemaind: %d\n", R1, R2);

end: @ End of program
	MOV R7, #1              @ exit(0);
	SWI 0
.endfunc


@ Division function
@ Input variable(register) is R0, R1
@ Return variable(register) is also R0, R1
@ If divide as 0 terminate program
@
.global div
.func div
div: @ Division Function
	push {lr}
	
	@ Copy data to arithetic work
	MOV R4, R0      @ Copy R0
	MOV R5, R1      @ Copy R1
	MOV R6, #0      @ R6 = 0 For Quatient

	CMP R5, #0
	BEQ err_0

@While
loop:
	SUBS R4, R4, R5     @ R4 = R4 - R5
	BMI fin             @ If subtraction result is negative go to fin
	ADD R6, R6, #1      @ R6 = R6 + 1
	B loop              @ Go to loop

@ End function
fin:
	ADD R4, R4, R5      @ In the loop, do the subtraction
                            @ and then Compare register.
	                    @ So to get correct answer, Add 1 time
                            @R4 = R4 + R5
	@Return parameter
	MOV R0, R6          @ Save Quatient
	MOV R1, R4          @ Save Remaind
	pop {pc}

@ Case of Error: divide with 0
err_0:
	LDR R0, =err1
	BL printf
	MOV R7, #1
	SWI 0
.endfunc


.global _start

_start:
	MOV R1, #3
	MOV R2, #4
	ADD R0, R1, R2
	
	@ADD R0, R1,  #0X14
	MOV R7, #1
	SWI 0

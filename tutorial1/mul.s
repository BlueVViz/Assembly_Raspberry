.global _start

_start:
	MOV R1, #0x14
	MOV R2, #0xA
	MUL R0, R1, R2
	MOV R7, #1
	SWI 0


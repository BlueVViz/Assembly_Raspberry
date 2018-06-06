.global _start

_start:
	MOV R1, #0x14
	MOV R2, #0xA
	MOV R3, #0x5
	MLA R0, R1, R2, R3
	MOV R7, #1
	SWI 0


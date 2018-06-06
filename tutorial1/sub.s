.global _start

_start:
	MOV R1, #0x14
	SUB R0, R1, #0xA
	MOV R7, #1
	SWI 0


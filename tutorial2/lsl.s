.global _start

_start:
	MOV R1, #15
	MOV R0, R1, LSL #1

end:
	MOV R7, #1
	SWI 0

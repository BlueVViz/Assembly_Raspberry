.global _start

_start:
	MOV R1, #15
	MOV R2, #6
	BIC R0, R1, R2

end:
	MOV R7, #1
	SWI 0

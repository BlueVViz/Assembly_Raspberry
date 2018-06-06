.global _start


_start:
	MOV R1, #5 @0101
	MOV R2, #9 @1001
	RSB R0, R2, R1

end:
	MOV R7, #1
	SWI 0

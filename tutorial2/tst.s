.global _start

_start:
	MOV R1, #0xff
	MOV R2, #0xff
	TST R1, R2
	BEQ _bit_set
	MOV R0, #1
	B end

_bit_set:
	MOV R0, #0

end:
	MOV R7, #1
	SWI 0

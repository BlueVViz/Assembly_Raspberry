.global _start

_start:
	MOV R1, #10
	MOV R2, #0
	TEQ R1, R2		@ xor RESULT == 0, SET Z FLAG
	BEQ _bit_set
	MOV R0, #1
	B end

_bit_set:
	MOV R0, #0

end:
	MOV R7, #1
	SWI 0

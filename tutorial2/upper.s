.global _start

_start:
	MOV R7, #3 @ Syscall keyboard
	MOV R0, #0 @ Input stream keyboard
	MOV R2, #1 @ Read 1 character
	LDR R1, =character
	SWI 0

_uppercase:
	LDR R1, =character
	LDR R0, [R1]

	@ a : 0110 0001
	@   : 0010 0000
	@ A : 0100 0001

	BIC R0, R0, #32
	
	STR R0, [R1]

_write:
	MOV R7, #4 @ Syscall output to screen
	MOV R0, #1 @ Output monitor
	MOV R1, #1 @ Number of characters
	LDR R1, =character
	SWI 0

end:
	MOV R7, #1
	SWI 0

.data
character:
	.ascii " "

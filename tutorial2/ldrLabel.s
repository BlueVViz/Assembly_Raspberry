.global _start

_start:
	LDR R3, =info
	LDR R0, [R3]

end:
	MOV R7, #1
	SWI 0

info:
	.word 10

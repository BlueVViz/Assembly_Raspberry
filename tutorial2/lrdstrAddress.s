.data
.balign 4
info:
.word 10


.text
.global _start

_start:
	LDR R3, =info
	MOV R4, #123
	STR R4, [R3]
	LDR R0, [R3]

end:
	MOV R7, #1
	SWI 0


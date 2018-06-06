.data
numbers:
	.byte 1, 2, 3, 4, 5

.text
.global _start


_start:
	LDR R3, =numbers
	@ LDR R0, [R3]
	@ LDR R0, ]R3, #1]
	LDR R0, [R3, #2]


end:
	MOV R7, #1
	SWI 0

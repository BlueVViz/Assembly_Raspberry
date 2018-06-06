.data
primes:
	.word 1
	.word 2
	.word 3
	.word 4
	.word 5

.text
.global _start


_start:
	LDR R3, =primes
	@ LDR R0, [R3]
	@ LDR R0, ]R3, #4]
	LDR R0, [R3, #8]


end:
	MOV R7, #1
	SWI 0

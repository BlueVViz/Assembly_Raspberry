asmtut: asmtut.o
		ld -o asmtut asmtut.o
asmtut.o:asmtut.s
		as -o asmtut.o asmtut.s
clean:
		rm *.o asmtut

debug:
		as -g -o asmtut.o asmtut.s
		ld -o asmtut asmtut.o
		gdb asmtut

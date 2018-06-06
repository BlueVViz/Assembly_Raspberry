asm:
	as -o wiringled.o wiringled.s
	as -o wiringint.o wiringint.s
	as -o wiringswitch.o wiringswitch.s

gcc:
	gcc -o wiringint wiringint.o -lwiringPi
	gcc -o wiringled wiringled.o -lwiringPi
	gcc -o wiringswitch wiringswitch.o -lwiringPi



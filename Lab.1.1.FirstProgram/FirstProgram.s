	AREA	FirstProgram, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
		MOV		R0, R1
		ADD 	R0,	R0, R0
		ADD 	R0,	R0, R0
		ADD 	R0,	R0, R0

stop	B	stop

	END	
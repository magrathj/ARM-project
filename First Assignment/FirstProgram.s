	AREA	FirstProgram, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	;var
	LDR r0, =1

	;consts
	LDR r1, =7
	LDR r2, =4   
	LDR r3, =6
	
	;7x^3 
	MUL r4, r0, r0
	MUL r4, r0, r4
	MUL r4, r1, r4 
	
	;4x
	MUL r5, r0, r2
	
	;total
	ADD r6, r3, r4
	ADD r7, r6, r5 
	
	
stop	B	stop

	END	
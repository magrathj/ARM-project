	AREA	SecondAssignment, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	
	LDR r0, =249		; set variables 
	LDR r1, =1
	LDR r4, =0

	LDR r2, =9

	AND r3, r0, r1
	ADD r4, r4, r3
	MOV r0, r0, LSR #1
	
	AND r3, r0, r1
	ADD r4, r4, r3
	MOV r0, r0, LSR #1
	AND r3, r0, r1
	ADD r4, r4, r3
	MOV r0, r0, LSR #1
	AND r3, r0, r1
	ADD r4, r4, r3
	MOV r0, r0, LSR #1
	AND r3, r0, r1
	ADD r4, r4, r3
	MOV r0, r0, LSR #1
	AND r3, r0, r1
	ADD r4, r4, r3
	MOV r0, r0, LSR #1
	AND r3, r0, r1
	ADD r4, r4, r3
	MOV r0, r0, LSR #1
	AND r3, r0, r1
	ADD r4, r4, r3
	MOV r0, r0, LSR #1
	AND r3, r0, r1
	ADD r4, r4, r3
	MOV r0, r0, LSR #1


	
	
	SUB r2, r2, r4


	
stop	B	stop

	END	
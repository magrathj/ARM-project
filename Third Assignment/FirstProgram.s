	AREA	ThirdAssignment, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	
	  LDR r2, =32
	  LDR r3, =0

	  MOVS r2, r2 ; set condition code flags

while
		BEQ endwh
		SUB r2, r2, #1
		ADD r3, r3, #1

		B while 
endwh

stop	B	stop

	END	
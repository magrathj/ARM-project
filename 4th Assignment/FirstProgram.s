	AREA	Assignment4, CODE, READONLY
	IMPORT	main
	EXPORT	start


start	
		LDR 	r1, =teststr 		; address = 0xA1000000
		LDR 	r3, =0				;counter
			
									; while ( (char = Memory.byte[address])
		B testwh1 					; != 0 ) {
wh1 	CMP r0, #0x20 				; if (char >= 'a'
		BNE endif1 					; AND
									;  {
		ADD	r3, r3, #1				;   counter = counter + 1;
endif1							    ; }
testwh1 LDRB r0, [r1], #1 			; }
		CMP r0, #0 					;				                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
		BNE wh1						;

	
stop B stop

		AREA TestData, DATA, READWRITE
teststr DCB "hello bye hi hiii ",0 				; NULL terminated test string

		END

	
	AREA	FifthAssignment, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	    LDR	r1, =teststr 
		LDR r2, =7
		LDR r3, =0	;minus check
		LDR r4, =0 ;check its done with 0x bit 
		LDR r5, =0
		LDR r8, =4
		LDR r10,=1
		LDR r11,=0
		LDR r12,=0x0000000F
		B testwh1		 
wh1
		CMP	r0, #0x2D	 
		BNE endif1
		ADD r3, r3,#1
endif1	
		CMP	r0, #0x78	 
		BNE endif2 
endif2
		CMP	r0, #'A'	 
		BCC endif3		 
		CMP r0, #'F'	
		BHI	endif3		
		SUB r0, r0, #55	
		MOV r6,r0		
		MOV r4, #1				
endif3
		CMP	r0, #'0'	 
		BCC endif4		 
		CMP r0, #'9'	
		BHI	endif4		
		SUB r0, r0, #48	
		MOV r6,r0		
		MOV r4, #1
endif4		
		CMP r4,#1
		BNE endif5
		MOV r5, r5, LSL #4
		ADD r5,r5,r6
endif5
testwh1
		LDRB r0, [r1], #1 ; }
		CMP	r0, #0 			;
		BNE wh1	 

		CMP r3,#1
		BNE endif6
		MVN r5,r5
		ADD r5,r5,#1
endif6
		LDR	r1, =teststr 
		LDR r4, = 8

		B testwh2		 
wh2
		CMP r10,#2
		BNE endif7
		MOV r9,r5
		RORS r9, r9, r8
		ASRS r9, r9, #28		
		AND r9, r9, r12
		ADD r9, r9, r7
		MOV r0, r9
		SUB r2,r2,#1
		STRB r0,[r1,r2]	
		MOV r11,#1		

endif7
		CMP r10,#1
		BNE endif8
		MOV r7,r5
		ROR r7, r7,r8
		ASR r7,r7,#28
		AND r7, r7, r12
		MOV r7, r7, LSL #4
		ADD r10, r10,#1
endif8				   
		CMP r11,#1
		BNE endif9
		SUB r10,r10,#1
		SUB r11, r11,#1
endif9
		ADD r8, r8, #4
		SUB r4, r4, #1
testwh2
		LDRB r0, [r1], #1 ; }
		CMP	r4, #0 			;
		BNE wh2	 

		
	
stop	B	stop

		AREA TestData, DATA, READWRITE
teststr	DCB	" -0xA34",0	; NULL terminated test string
	

	END
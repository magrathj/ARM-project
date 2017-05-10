		AREA SIXTHASSIGNMENT, CODE, READONLY
		IMPORT main
		EXPORT start
start
		LDR	r1, =teststr 	
		LDR R12, =STK_TOP
		LDR r3,=0
		LDR r4, =0xA1000404


		B testwh1
wh1
		CMP r0,#0x28
		BNE endif1
		STR r0,[r12,#-4]!
	
endif1
		CMP r0,#0x29
		BNE endif2
		STR r0,[r12,#-4]!
		LDR r0,[r12],#4	 
		LDR r0,[r12],#4		
endif2

testwh1	LDRB r0,[r1],#1
		CMP r0,#0
		BNE wh1

		CMP r12, r4
		BNE endif3
		MOV r3, #1
endif3

		

stop B stop

STK_SZ EQU 0x400 	   
	
		AREA TestData, DATA, READWRITE
teststr	DCB	" ((((()))))",0	; NULL terminated test string
		AREA Stack, DATA, READWRITE
STK_MEM SPACE STK_SZ
STK_TOP

	END
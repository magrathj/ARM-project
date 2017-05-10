	AREA	AsmTemplate, CODE, READONLY
	IMPORT	main

; Program to display all 16 hexadecimal digits on a 7 segment display, starting at F, then E, working down to 0, 
; before starting at F again

	EXPORT	start
start

IO1DIR	EQU	0xE0028018
IO1SET	EQU	0xE0028014
IO1CLR	EQU	0xE002801C
IO1PIN	EQU 0xE0028010

IO0DIR	EQU	0xE0028008
IO0SET	EQU	0xE0028004
IO0CLR	EQU	0xE002800C				 ;for pins on I/0 pins

	ldr	r1,=IO0DIR
	ldr	r2,=0x00000ff0	;select P0.11 - P0.4 (P0.4 is the top of the 7 segment display, pins are assigned clockwise around the outside, then center, then decimal place
	str	r2,[r1]			;make them outputs
	ldr	r1,=IO0SET
	str	r2,[r1]			;set them to turn the LEDs off
	ldr	r2,=IO0CLR
						; r1 points to the SET register
						; r2 points to the CLEAR register
	ldr r6, =IO1PIN


	B first	 ;On the first run, skip past the resetting of r8 and r10
loop	
	ldr r8,=0x00010000
	ldr r10, =0x00080000
first
	ldr	r3,=0x00F00000
;Note 
;	P1.16 = 0x00010000, P1.17 = 0x00020000, 
;	P1.18 = 0x00040000, P1.19 = 0x00080000 

forLoop	 				;For 4 LEDs
	;str	r3,[r2]	   		; clear the bit -> turn on the LED

	ldr r7, [r6]

	ANDS r9, r3, r7
	CMP r9, r3
	BEQ	skip

	str	r8,[r2]	   		; clear the bit -> turn on the LED
	str	r10,[r1]		;set the bit -> turn off the LED prior to r8


	;While the button is still pressed down, so nothing
whileLoop
	ldr r7, [r6]
	ANDS r9, r3, r7
	CMP r9, r3
	BNE whileLoop

	;Loop to delay for a half second
	ldr	r4, =2000000
delayLoop	
	subs	r4,r4,#1
	bne	delayLoop

	mov r8,r8,lsl #1
	mov r10, r10, lsl #1
	;If r10 has reached the mask, set it back to the first LED
	cmp r10, r5
	BNE skip
	ldr r10, =0x00010000	
skip
	cmp	r8,r5			;Check if we've reached the mask yet (i.e. P1.20)
	bne	forLoop

	b	loop

stop	B	stop

	END					  
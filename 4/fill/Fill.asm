// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.


(LOOP)
	@SCREEN
	D=A
	@addr
	M=D
	@KBD	// keyboard input
	D=M	// D has value of key 
	@BLACK 	// paint black if pressed
	D;JNE 	// not 0 -> pressed
	@WHITE 
	D;JEQ 	// paint white if not pressed
	@LOOP 
	0;JMP	// repeat

(BLACK)
	@addr 	// addr is now the address of the current pixel
	A=M
	M=-1 	// paint pixel
	@addr
	M=M+1	// move to the next pixel	
	D=M 	// set D to the next pixel
	@KBD 	// get KBD address
	D=A-D 	// check if the "pointer" reached to KBD address 
	@BLACK 
	D;JNE 	// paint the next register
	@LOOP
	0;JMP

(WHITE)
	@addr 	// addr is now the address of the current pixel
	A=M
	M=0 	// paint pixel
	@addr
	M=M+1	// move to the next pixel	
	D=M 	// set D to the next pixel
	@KBD 	// get KBD address
	D=A-D 	// check if the "pointer" reached to KBD address 
	@WHITE 
	D;JNE 	// paint the next register
	@LOOP
	0;JMP  
	
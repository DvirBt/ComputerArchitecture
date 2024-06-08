// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

@R2 // set R0 to 0
M=0
// Checking vaildation of inputs
@R0
D=M
@END
D;JEQ // if R0=0 -> go to END
@R1
D=M
@END
D;JEQ // R1=0 -> go to END
(LOOP)
	@R1
	D=M // value of R1
	@R2 
	M=D+M // sum the current value of R2 with R1
	@R0 // get the number of iterartions
	M=M-1 // minus 1 iteration
	D=M
	@LOOP
	D;JGT // if D>0 -> repeat another iteration, else -> END
(END) 






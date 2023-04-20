// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

//lets first write the pseudo-code for this:
//n = R0
// i = 1
// sum = 0
// for i in b:
// if i > b --> Stop
// sum = sum + a
// for
// Stop
// R1 = sum

// initilized our 'variables'

@R1 // here we have the b, value we are going to run till him
D=M

// n = R0, to not harm or change register 0
@n
M=D

// sum = 0
@sum
M=0

//i = 1, so we won't multiply by zero
@i
M=1

// Statring the loop, i>n stopping, when D = D-M --> D > 0, D;JGT, means i > n
(LOOP)
@i
D=M // i = 1

@n
D=D-M // i > 0 ?

@STOP
D;JGT // will Jump to the end

@R0
D=M // D = a
@sum

M=M+D // M = a + a

@i   // i = i + 1 
M=M+1

@LOOP
0;JMP // jumping with out condition to the beginning of the declering on (LOOP), htere we have stop condition

(STOP) // comming here from the declering on @STOP
// R2 = sum
@sum
D=M // saving 'M' content in D, as an temp variavble

@R2
M=D // putting in R2 register in the content 'M' the value int the temp variable D

(END)
@END
0;JMP // endless loop, for finishing the program
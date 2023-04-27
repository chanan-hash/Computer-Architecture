// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here. 
//Listening if the key is pressed
(PRESSED)
    @SCREEN
    D=A

    @i
    M=D

    @KBD
    D=M

    @FILL
    D;JGT

    @PRESSED
    0;JMP

(STOP_PRESS)
    @SCREEN
    D=A

    @i
    M=D

    @KBD
    D=M

    @CLEAR_SCREEN
    D;JEQ

    @STOP_PRESS
    0;JMP


(FILL)
    (BLACK)
    @i
    A=M
    M=-1 // this is how we color in black, because of the Two's complement

    @i
    M=M+1

    @KBD
    D=A
    @i
    D=D-M

    @BLACK
    D;JGT

@STOP_PRESS
0;JMP

(CLEAR_SCREEN)
    (WHITE)
        @i
        A=M
        M=0 // means white

        @i
        M=M+1

        @KBD
        D=A
        @i
        D=D-M

        @WHITE
        D;JGT

@PRESSED
0;JMP
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
    D=A // D = Screen adress

    @i
    M=D // M = Screen adress 16384, the loop will strt from i = 16384

    @KBD
    D=M     // KBD = 24576, D=16384

    @FILL // got to fill register and jump if D is greater than 0 D > 0
    D;JGT

    @PRESSED // if you got here go back to pressed, unconditional jump
    0;JMP

(STOP_PRESS)
    @SCREEN // keep in D screen address D = 16384
    D=A

    @i
    M=D  // M = Screen adress 16384, the loop will strt from i = 16384

    @KBD
    D=M // KBD = 24576, D = 16384 = M

    @CLEAR_SCREEN
    D;JEQ     // go to clearScreen id D == 0

    @STOP_PRESS // if you got here go back to stop press
    0;JMP


(FILL)
    (BLACK)
    @i
    A=M // A The ram address wil be equal to what is in M, in the beginning is 16384, because now M = 16834, grom line 40
    M=-1 // this is how we color in black, because of the Two's complement

    @i
    M=M+1 // i++ -1 + 1 = 0

    @KBD
    D=A // D = 24576
    @i
    D=D-M // D = 24576 - 1 ?

    @BLACK
    D;JGT // jumpt o black if D > 0

@STOP_PRESS // if we got hehre means we've stopped pressing
0;JMP

(CLEAR_SCREEN)
    (WHITE)
        @i
        A=M 
        M=0 // means white

        @i
        M=M+1 // i++

        @KBD
        D=A
        @i
        D=D-M

        @WHITE
        D;JGT

@PRESSED
0;JMP
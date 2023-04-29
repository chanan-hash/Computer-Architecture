// bonus assignment
// Keyboard input to screen output code in HACK assembly language

// Constants
// Memory map starts at address 0
// Screen memory starts at address 16384
// Keyboard memory starts at address 24576
// Keyboard memory is read-only
// The ASCII code for 'C' is 67
// The ASCII code for 'S' is 83

// Initialize variables


// need to be modified, not working

// Set up constants
@SCREEN
D=A
@i
M=D
@KBD
D=M
@CHAR_C
M=A // M = 67
@CHAR_S
M=A // M = 83

// Infinite loop
(LOOP)
    // Check if the keyboard is pressed
    @KBD
    D=M
    @PRESSED
    D;JNE
    // If not pressed, clear the screen
    @SCREEN
    D=A
    @i
    M=D
    @CLEAR_SCREEN
    0;JMP
(PRESSED)
    // Write 'C' or 'S' to the screen depending on the key code
    @KBD
    D=M
    @CHAR_C
    D=D-M
    @WRITE_C
    D;JEQ
    @CHAR_S
    D=D-M
    @WRITE_S
    D;JEQ
    // If not 'C' or 'S', go back to waiting for a key press
    @LOOP
    0;JMP
(WRITE_C)
    // Write 'C' to the screen
    @SCREEN
    A=M
    @CHAR_C
    M=-1 // M = CHAR_C
    @SCREEN
    M=M+1
    // Go back to waiting for a key press
    @LOOP
    0;JMP
(WRITE_S)
    // Write 'S' to the screen
    @SCREEN
    A=M
    @CHAR_S
    M=-1   //M=CHAR_S
    @SCREEN
    M=M+1
    // Go back to waiting for a key press
    @LOOP
    0;JMP
(CLEAR_SCREEN)
    // Clear the screen by writing all zeros
    (WHITE)
    @i
    A=M
    M=0
    @i
    M=M+1
    @SCREEN
    D=A
    @i
    D=D-M
    @WHITE
    D;JGT
    // Go back to waiting for a key press
    @LOOP
    0;JMP


// Set up constants

// (PRESSED)
//     @SCREEN
//     D=A // screen address

//     @i
//     M=D // loop starting

//     @KBD
//     D=M

//     @FILL
//     D;JGT

//     @PRESSED
//     0;JMP

// (STOP_PRESS)
//     @SCREEN
//     D=A

//     @i
//     M=D

//     @KBD
//     D=M

//     @CLEAR_SCREEN
//     D;JEQ

//     @STOP_PRESS
//     0;JMP

// @0
// D=A
// @SCREEN
// M=D
// @KBD
// M=D
// @67
// D=A
// @CHAR_C
// M=D
// @83
// D=A
// @CHAR_S
// M=D

// // Infinite loop
// (LOOP)
//     // Wait for a key press
//     @KBD
//     D=M
//     @LOOP
//     D;JLE
//     // Read the key code
//     @KBD
//     D=M
//     // Check if the key code is C or S
//     @CHAR_C
//     D=D-M
//     @OUTPUT
//     D;JEQ
//     @CHAR_S
//     D=D-M
//     @OUTPUT
//     D;JEQ
//     // If the key is not C or S, go back to waiting
//     @LOOP
//     0;JMP
// (OUTPUT)
//     // Output the key code to the screen
//     @SCREEN
//     A=M
//     M=D
//     // Increment the screen memory pointer
//     @SCREEN
//     M=M+1
//     // Go back to waiting
//     @LOOP
//     0;JMP

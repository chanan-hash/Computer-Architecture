// coloring the screen like checkers
(COlOR)
@SCREEN
D=A
M=-1
@START
M=D  // saving in variable the start of the screen
(ROW_C) // coloring a row // need to step 51
    @i
    M=0
    @START
    A=D+M
    M=-1
    @i
    M=M+1
    @51 //condition stop
    D=A
    @LOOP
    D=D-M
    D;JLT
    @ROW_C
    0;JMP // we will run with loop and color the first column till 20,480
    
    @j
    M=0
(LOOP)
    @START
    D=M
    M=-1    
    @ROW_R
    M=D
    @20480
    D=A
    @j
    D=D-M
    @ROW_C
    D;JLT

    @j
    M=M+1
    @LOOP
    0;JMP

(EXIT)
    @EXIT
    0;JMP
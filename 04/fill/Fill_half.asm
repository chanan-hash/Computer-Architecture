// Filling half of the screen in black
//@20511
@SCREEN
D=A
M=-1
@i
M=D // the start point
(LOOP)
    //the jump
    @20512
    D=A
    @i
    D=D-M
    @END
    D;JLE
    @i
    D=M
    @arr / this is important because this is represent the arr[i]
    A=D+M
    M=-1
    @i
    M=M+1
    @LOOP
    0;JMP
(END)
    @END
    0;JMP

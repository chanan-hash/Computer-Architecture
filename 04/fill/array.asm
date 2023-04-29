// for (i = 0 ; i<n; i++){
// arr[i] = -1
//}

@17840
D=A

@arr
M=D // M = 100

@10
D=A

@n
M=D // n =10

@i
M=0 // i = 0
(LOOP)
    @i
    D=M // D = 0

    @n
    D=D-M
    @END
    D;JEQ //D == 0, Jump

    @arr
    D=M
    @i // RAM[arr+i] = -1
    A=D+M
    M=-1
    
    @i
    M=M+1
    @LOOP
    0;JMP

(END)
    @END
    0;JMP
# based on explantation from https://www.youtube.com/watch?v=P4F3FtCY1Pc
j main

fib: 
    bgt $a0 , 1 fib_rec
    move $v0  $a0
    jr $ra

fib_rec:
    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $a1, 4($sp)

    addi $a1, $a1 ,-1
    jal fib

    sw $v0 , 8($sp)

    addi $a1, $a1, -2
    jal fib
    lw $t0 , 4($sp)
    add $v0, $t0, $v0

    lw $a1 , 4($sp)
    lw $ra , 0($sp)
    
    addi $sp,$sp, 12
    jr $ra
    
main:
    li		$a1, 3		# $a1 = 4
    jal		fib				# jump to fib and save position to $ra
    add		$s0, $0, $v0		# $s0 = $0 + $v0
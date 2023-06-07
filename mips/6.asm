# $t0 = sum
# $a0 = i
# $a1 = addr
# $t1 = j
StrangeSum:

#li $a0 , 
li $t0, 0
li $t1, 0
li $t7, 3 # constant of incrementing by 3
addi $a0, $a0, 1 # that j < i
	loop:
	slt $t2, $t1, $a0
	beq $t2, $0, done
	sll $t3 $t1, 2 # offset of 4 for the addrtess
	add $t3, $t3, $a1
	lw $t4 0($t3) # $t4 = arr[j]
	mult $t4, $t7
	mflo $t4
	sw $t4 , 0($t3)
	
	add $t0, $t0, $t3
	
	addi $t1, $t1, -1 # j--
	addi $t1, $t1, 3 # t1 += 3
		
	j loop
done:		
	addi $a0, $a0, -1 # that j < i
	
	addi $sp , $sp -8
	sw $ra , 4($sp)
	sw $a0 , 0($sp)
	
	add $a0, $0, $t0
	jal multi
	
	lw $a0, 4($sp)
	lw $ra, 4($sp)

	addi $sp, $sp, 8
			
	add $v0 ,$t0, $0 # retrun sum 
	#jr $ra

multi : 
	li $t0, 12
	mult $t0, $a0
	mflo $v0
	jr $ra

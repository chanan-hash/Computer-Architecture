# init address a[0] = 1, a[1] =3, a[3] =5 .....
# for i in 30:
#   a[i] = i+2-1 
# $s0 = base address , $t1 = i, #$t2 = 29
# 10011020
lui $s0 0x1001 
ori $s0, $s0 0x1020

li $t1, 1 # the valuse to add
li $t2, 30
li $t3, 0
li $t5 ,0 # i
loop: 
	slt $t3 ,$t1, $t2
	beq $t3, $0, done
	addiu $t4, $t4, 4   # mult by 4, to the adressers
	add $s0, $s0, $t4 # address progress
	sw  $t1, 0($s0)   # saving the valuse in the ofset of thr address, inserting to cell $s0 + 0 
	addi $t1,$0, 2
	addi $t5 ,$0, 1 
	j loop
done:
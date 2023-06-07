# $s0 will represent A series
# $s1 will represent B series
# $s2 will represent C series

li $s0 , 1
li $s1 , -1
li $s2 , 1
sll $s2 $s2, 9 # 2^9

# $t0 = i, $s5 = sum, $t2 = 10 --> the end of the loop, t3 saving the multiplicatin
addi $s5 ,$0, 0
li $t0 , 0
addi $t1, $0, 10
# if t0 < 10 --> i < 10, $t2 saves 1 or 0, if it's true or false
loop: slt $t2, $t0 , $t1 
	beq $t2, $0, done
 	mult $s0,$s1
 	mflo $t3
 	mult $s2, $t3
 	mflo $t3
 	add $s5, $s5, $t3 # s5 = s5 + t3
 	
 	# $s0 = $s0*4
 	sll $s0,$s0, 2
 	
 	# $s1 = $s1 *-1
 	li $t3 ,-1
 	mult $s1, $t3
 	mflo $s1
  
  	# $s2 = s2/2
  	srl $s2, $s2 ,1
  	# i++ 
  	addi $t0, $0 ,1
  	j loop
done:
# 0x0002aa00 --> 174592 dec
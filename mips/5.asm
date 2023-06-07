# j main
# fib(n):
    # if(n <=1):
        # if n<=0:
        #     return 0
        # else:
        #     return 1
#    else:
#       return fub(n-1) + fib(n-2)

fib:
    # store ra, a1
    addi	$sp, $sp, -8			# $sp = $sp + -8
    sw		$a1, 4($sp)		# 
    sw		$ra, 0($sp)		# 
    
    li		$t1, 1 		# $t1 = 1
    bgt		$a1, $t1, else	# if $a1 > $t1 then goto else
    bgt		$a1, $0, r_1	# if $a1 > 0 then goto r_1
        addi		$v0, $0, 0	# $v0 = 0
        j		free_stack				# jump to free_stack
    r_1:
        addi	$v0, $0, 1			# $v0 = 1
        
    free_stack:
        addi	$sp, $sp, 8			# $sp = $sp + 0
        jr		$ra					# jump to $ra
        
    
    else: # recursive call
        # n = n-1
        addi	$a1, $a1, -1			# $a1 = $a1 + -1
        # call fib(n-2)
        jal		fib				        # jump to fib and save position to $ra
        
        # get the n from the stack
        lw		$a1, 4($sp)	
        # n = n -2
        addi	$a1, $a1, -2

        # store the result of fib(n-1) in the stack
        addi	$sp, $sp, -4			# $sp = $sp + -4
        sw		$v0, 0($sp)

        # call fib(n-2)
        jal		fib				        # jump to fib and save position to $ra

        # get the value of fib(n-1) from the stack
        lw      $t2, 0($sp)
        addi	$sp, $sp, 4 # pop the stack

        # v0 = fib(n-2) + fib(n-1)
        add		$v0, $v0, $t2		    # $s0 = $v0 + $s0
        
        # get ra from the stack
        lw		$ra, 0($sp)	
        addi	$sp, $sp, 8 # pop the stack
        # return v0
        jr		$ra					    # jump to $ra
         
# main:
#     li		$a1, 4	                    # $a1 = 4
#     jal		fib				            # jump to fib and save position to $ra
#     add		$s0, $0, $v0	            # $s0 = $0 + $v0
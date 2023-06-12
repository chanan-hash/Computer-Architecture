# assuming: $a0 store i, $a1 store 

#testing
j main

strange_sum:
    #init:
    # $t0 = sum = 0
    # $t1 = j = 0

    addi		$t0, $0, 0		# $t0 = 0
    addi		$t1, $0, 0		# $t1 = 0
    addi		$t7, $0, 3		# $t7 = 3
    addi		$t8, $0, 4		# $t7 = 4
    
    addi	$a0, $a0, 1			# $a0 = $a0 + 1 // to make j<=i
    
    loop:                                   # j<i

        slt		$t2, $t1, $a0		# $t2 = ($t1 < $a0) ? 1 : 0
        beq		$t2, $0, end_loop	# if $t2 == $0 then goto end_loop
        
        # init j to point to arr[j]
        mult	$t1, $t8			# $t1 * $t8 = Hi and Lo registers // j*4
        mflo	$t3					# copy Lo to $t2 // t3 = j*4
        add		$t3, $t3, $a1		# $t3 = $t3 + $a1 // t3 = j*4 + addr_of_arr

        lw		$t4, 0($t3)		    # t4 = arr[j]
        mult	$t4, $t7			# arr[j] * 3 = Hi and Lo registers
        mflo	$t4					# copy Lo to $t2
        sw		$t4, 0($t3)		    # arr[j] = arr[j]*3

        # sum += arr[j]
        add		$t0, $t0, $t4		# $t0 = $t0 + $t4
        
        #j--
        addi	$t1, $t1, -1			# $t1 = $t1 + -1
        #j+=3
        addi	$t1, $t1, 3			# $t1 = $t1 + 3
        
        j loop
        
                
    end_loop:
        addi	$a0, $a0, -1			# $a0 = $a0 + 1 // return i to original value
    
    # store in the stack ra, a0
    addi	$sp, $sp, -8			# $sp = $sp + -8 # make room for 2 var for save in the stack
    sw		$ra, 4($sp)		        # save ra
    sw		$a0, 0($sp)		        # save a0

    # $a0 = sum
    add		$a0, $0, $t0		# $a0 = $0 + $t0
    jal		multi				# jump to multi and save position to $ra

    lw		$a0, 0($sp)		    # load a0
    lw		$ra, 4($sp)		    # load ra
    addi	$sp, $sp, 8			# $sp = $sp + 8 # return the stack pointer to place
    

    #return sum
    add		$v0, $0, $t0		# $v0 = $0 + $t0
    jr		$ra					# jump to $ra
    
multi:
    addi		$t0,$0, 12		# $t0 = 12
    mult	$t0, $a0			# $t0 * $a0 = Hi and Lo registers
    mflo	$v0					# copy Lo to $v0
    jr		$ra					# jump to $ra
    
main:
    addi	$a0, $0, 4		# $t0 = 12
    lui     $a1, 0x1001
    jal		load_array				# jump to load_array and save position to $ra
    jal		strange_sum				# jump to strange_sum and save position to $ra
    add	$s0, $v0, $0			# $s0 = $v0 + 0
    j		end				# jump to end
    
load_array:
    add		    $t0, $a1, $0		# $t0 = $a0 + $0
    addi		$t1, $0, 1		# $t1 = 1
    addi		$t2, $0, 9		# $t2 = 29

    loop2:
        bgt		$t1, $t2, done	# if $t1 > $t2 then goto done
        # save n into the address
        sw		$t1, 0($t0)		    # $t0 = $t1
        # progress of the address
        addi		$t0, $t0, 4		# $t0 = $t0 + 4
        # n+=2
        addi	$t1, $t1, 2			# $t1 = $t1 + 2

        j		loop2				# jump to loop2
    done:
    jr		$ra					# jump to $ra
    
end: 

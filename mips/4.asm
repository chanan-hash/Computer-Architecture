j main
# $s1 - base address
# $s2 - array size
# $t0 - counter for exceptions
# $t1 - i
func: 
addi	$t0, $0, 0			# $t0 = $0 + 0
addi	$t1, $0, 0			# $t1 = $0 + 0

loop: 
    beq		$t1, $s2, end_loop	# if $t1 == $s2 then goto end
    sll		$t3, $t1, 2			# $t3 = $t1 << 2 // i*4
    add		$t3, $t3, $s1	# $t3 = $t3 + s1 // adding the base addres t0 $t3

    lw $t4 , 0($t3)
    mult	$t4, $t4		# $t4 * $t4 = Hi and Lo registers
    mflo	$t4					# copy Lo to $t2

    sw		$t4, 0($t3)		# becasue t3 three is our jumping in the array a[i]

    mfhi $t4

    addi	$t1, $t1, 1			# $t1 = $t1 + 1
    

    beq		$t4, $0, loop	# if $t4 == $0 then goto loop
    addi	$t0, $t0, 1			# $t0 = $0 + 1
    j		loop				# jump to loop
       
end_loop:
    jr		$ra					# jump to $ra


load_array:
    add		    $t0, $s1, $0		# $t0 = $s1 + $0
    addi		$t1, $0, 1		# $t1 = 1
    addi		$t2, $0, 9		# $t2 = 29

    loop2:
        bgt		$t1, $t2, done	# if $t1 > $t2 then goto done
        # save n into the address
        sw		$t1, 0($t0)		    # $t0 = $t1
        # progress of the address
        addi		$t0, $t0, 4		# $t0 = $t0 + 4
        # n+=2
        addi	$t1, $t1, 1			# $t1 = $t1 + 2

        j		loop2				# jump to loop2
    done:
    lui     $t1, 0x0FFF
    ori     $t1, 0xFFFF
    sw		$t1, 0($t0)
    jr		$ra					# jump to $ra

main:
    lui     $s1, 0x1001
    addi	$s2, $0, 10			# $s2 = $0 + 9
    
    jal		load_array				# jump to load_array and save position to $ra
    jal		func				# jump to func and save position to $ra
        
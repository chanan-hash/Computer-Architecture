# init:
# $t0 = addr
# $t1 = n (init to 1)
# $t2 = end (init to 29)

# $t0 = 0x10011020
lui $t0, 0x1001
ori $t0, 0x1020

addi		$t1, $0, 1		# $t1 = 1
addi		$t2, $0, 29		# $t2 = 29

loop:
    bgt		$t1, $t2, done	# if $t1 > $t2 then goto done
    # save n into the address
    sw		$t1, 0($t0)		    # $t0 = $t1
    # progress of the address
    addi		$t0, $t0, 4		# $t0 = $t0 + 4
    # n+=2
    addi	$t1, $t1, 2			# $t1 = $t1 + 2

    j		loop				# jump to loop
done:
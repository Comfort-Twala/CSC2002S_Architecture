# Comfort Twala
# question3.asm -- Rotate a 3x3 character matrix with given number of rotations
# Registers used:
#	$t0 - first row
#	$t1 - second row
#	$t2 - third row
#	$t3 - rotations
#	$t4 - rotations counter
#	$s0 to $s8 - matrix values

	.text
main:
	# Prompt
	la		$a0, prompt
	li		$v0, 4
	syscall

	## Get user input and store into registers
	# first row
	li		$v0, 8
	la		$a0, row1
	li		$a1, 1024
	move	$t0, $a0
	syscall

	# second row
	li		$v0, 8
	la		$a0, row2
	li		$a1, 1024
	move	$t1, $a0
	syscall

	# third row
	li		$v0, 8
	la		$a0, row3
	li		$a1, 1024
	move	$t2, $a0
	syscall

	# rotations
	li		$v0, 5
	syscall
	move	$t3, $v0

	rem		$t3, $t3, 4 # Finding the remainder to have range [-4 to 4]
  	add		$t3, $t3, 4 # Adding 4 to the remainder for positive rotations
	li		$t4, 0		# setting counter to 0
	b		rotate
	b		end_program

rotate:
	beq		$t3, $t4, end_program  # End program if number of rotations reached
	addi 	$t4, $t4, 1			   # Increment counter
			
	## Storing matrix values into registers
	# First row
	lb		$s0, ($t0)
	lb		$s1, 1($t0)
	lb		$s2, 2($t0)

	# Second row
	lb		$s3, ($t1)
	lb		$s4, 1($t1)
	lb		$s5, 2($t1)

	# Third row
	lb		$s6, ($t2)
	lb		$s7, 1($t2)
	lb		$s8, 2($t2)

	## Storing rotated values into registers
	# new first row
	sb		$s6, ($t0)
	sb		$s3, 1($t0)
	sb		$s0, 2($t0)

	# new second row
	sb		$s7, ($t1)
	sb		$s4, 1($t1)
	sb		$s1, 2($t1)

	# new third row
	sb		$s8, ($t2)
	sb		$s5, 1($t2)
	sb		$s2, 2($t2)

	b		rotate

end_program:
	## Printing output
	# Printing first row
	move 	$a0, $t0
	li	$v0, 4
	syscall

	# Printing second row
	move 	$a0, $t1
	li	$v0, 4
	syscall

	# Printing third row
	move 	$a0, $t2
	li	$v0, 4
	syscall

	# Exiting program
	li	$v0, 10
	syscall

# Data for the program
	.data
row1:		.space	1024
row2:		.space	1024
row3:		.space	1024
prompt:	.asciiz "Enter a 3x3 matrix:\n"

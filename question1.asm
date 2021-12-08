# Comfort Twala
# question1.asm -- Program that receives 3 seperate lines of input, in the order 0-1-2, and reorders them according to the following sequence: 2-0-1. 
# Registers used:
#	$t0	- hold 1st number
#	$t1	- hold 2nd number
#	$t2	- hold 3rd number
#	$v0	- syscall parameter
#	$a0	- syscall parameter

	.text
main:
	# Prompt
	la	$a0, user_list
	li	$v0, 4
	syscall

	## Get user input and store into registers
	# first line
	li	$v0, 8
	la	$a0, input1
	li	$a1, 1024
	move	$t0, $a0
	syscall

	# second number
	li	$v0, 8
	la	$a0, input2
	li	$a1, 1024
	move	$t1, $a0
	syscall

	# third number
	li	$v0, 8
	la	$a0, input3
	li	$a1, 1024
	move	$t2, $a0
	syscall

	# Prompt
	la	$a0, reordered_list
	li	$v0, 4
	syscall

	## Printing output
	# Printing 2
	la	$a0, input3
	move 	$a0, $t2
	li	$v0, 4
	syscall

	# Printing 0
	la	$a0, input1
	move 	$a0, $t0
	li	$v0, 4
	syscall

	# Printing 1
	la	$a0, input2
	move 	$a0, $t1
	li	$v0, 4
	syscall

	# Exiting program
	li	$v0, 10
	syscall

# Data for the program
	.data
input1:		.space	1024
input2:		.space	1024
input3:		.space	1024
user_list:	.asciiz "Enter a list of 3 lines:\n"
reordered_list:	.asciiz "The reordered list is:\n"

# end of question1.asm

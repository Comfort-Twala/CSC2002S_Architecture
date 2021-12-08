# Comfort Twala
# question2.asm -- Compute a simple integer sum from user input
# Registers used:
#	$t0	- Sum input
#	$t1	- current num
#	$t2	- current sum
#	$t3	- stores the sign

	.text
main:
	#Prompt
	la		$a0, prompt
	li		$v0, 4
	syscall

	# Get input string
	li		$v0, 8
	la		$a0, string_input
	li		$a1, 1024
	move	$t0, $a0
	syscall

	# initialise sum
	lb		$t2, ($t0)			## Initialise the sum as the first value
	beq		$t2, '-', neg_start ## If input starts with a negative sign
	addi	$t2, $t2, -48		## Convert to decimal value
	addu	$t0, $t0, 1
	b		loop
neg_start:
	li		$t2, 0				## Initialise the sum as 0
	b		loop
loop:
	lb		$t3, ($t0)			## Store the sign
	lb		$t1, 1($t0)			## Store the value
	addu	$t0, $t0, 2			## increment the counter

	beq		$t1, 10, end_loop	## If reached the end of the string

	# Convert to decimal value
	addi	$t1, $t1, -48
	addi	$t3, $t3, -48

	# Manipulate sign value to 1 if '+', -1 if '-'
	add		$t3, $t3, 4			
	mul		$t3, $t3, -1

	mul		$t1, $t1, $t3		## multiply the sign with the value

	add		$t2, $t2, $t1		## Add the value to the sum

	b		loop				# re-iterate

end_loop:
	# Printing the total sum
	move	$a0, $t2
	li		$v0, 1
	syscall
	
	# Exiting program
	li	$v0, 10
	syscall

	.data
string_input:	.space	1024
prompt:		.asciiz	"Enter a sum:\n"
debug:		.asciiz	"sign changed\n"

# end of question2.asm

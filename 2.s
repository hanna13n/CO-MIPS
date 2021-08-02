.data
msg1: .asciiz "Enter the first number: "
msg2: .asciiz "Enter the second number: "
tprime: .asciiz "They are twin primes.\n"
nottprime: .asciiz "They are not twin primes.\n"

.text
.globl main
main:
	li $v0,4
	la $a0,msg1
	syscall

	li $v0,5
	syscall
	move $t0,$v0

	li $v0,4
	la $a0,msg2
	syscall

	li $v0,5
	syscall
	move $t1,$v0

	sub $t2,$t1,$t0
	li $t3,2
	bne $t3,$t2,nottwo
	j loopstart
	nottwo:
	li $t3,-2
	bne $t3,$t2,nottwinprime
	
loopstart:
	li $t2,2
	div $t3,$t0,$t2
	for1:
		bgt $t2,$t3,n1prime
		
		rem $t4,$t0,$t2
		beq $t4,$zero,nottwinprime
	
		addi $t2,$t2,1
		j for1

n1prime:
	li $t2,2
	div $t3,$t1,$t2
	for2:
		bgt $t2,$t3,istprime
		
		rem $t4,$t1,$t2
		beq $t4,$zero,nottwinprime
	
		addi $t2,$t2,1
		j for2

exit:
li $v0,10
syscall

istprime:
li $v0,4
la $a0,tprime
syscall
j exit

nottwinprime:
li $v0,4
la $a0,nottprime
syscall
j exit

	
	
	 
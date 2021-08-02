.data
msg1: .asciiz "Enter the number of terms: "
msg2: .asciiz "Fibonacci series: "
space: .asciiz " "

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

	li $t1,0
	li $t2,0
	li $t3,1
	fib:
		beq $t1,$t0,end
		
		li $v0,1
		move $a0,$t2
		syscall
		
		li $v0,4
		la $a0,space
		syscall 

		add $t4,$t2,$t3
		move $t2,$t3
		move $t3,$t4

		addi $t1,$t1,1
		j fib
end:
li $v0,10
syscall	





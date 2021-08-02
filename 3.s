.data
msg1: .asciiz "Enter the first string: "
msg2: .asciiz "Enter the second string: "
msg3: .asciiz "The required string: "
string1: .space 100
string2: .space 100

.text
.globl main
main:
	li $v0,4
	la $a0,msg1
	syscall

	li $v0,8
	la $a0,string1
	li $a1,100
	syscall

	li $v0,4
	la $a0,msg2
	syscall

	li $v0,8
	la $a0,string2
	li $a1,100
	syscall

	la $t0,string1
	li $t2,'\n'
	for:
		lb $t1,0($t0)
		beq $t1,$t2,endloop
		addi $t0,1
		j for
	endloop:
	li $t1,' '
	sb $t1,0($t0)
	addi $t0,1
	la $t3,string2
	copy:
		lb $t1,0($t3)
		sb $t1,0($t0)
		beq $t1,$t2,print
		addi $t3,1
		addi $t0,1
		j copy

	print:
		li $v0,4
		la $a0,msg3
		syscall	
		
		li $v0,4
		la $a0,string1
		syscall	
exit:
li $v0,10
syscall	
	
		
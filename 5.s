.data
msg1:.asciiz "Enter the string : "
msg2:.asciiz "Enter the word to be replaced : "
msg3:.asciiz "Enter the new word : "
msg4:.asciiz "The modified string : "
space:.asciiz " "
newline:.asciiz "\n"
string:.space 100
replace:.space 100
new:.space 100
word:.space 100

.text
.globl main
main:
	li $v0,4
	la $a0,msg1
	syscall

	li $v0,8
	la $a0,string
	li $a1,100
	syscall

	li $v0,4
	la $a0,msg2
	syscall
	
	li $v0,8
	la $a0,replace
	li $a1,100
	syscall

	li $v0,4
	la $a0,msg3
	syscall
	
	li $v0,8
	la $a0,new
	li $a1,100
	syscall

	li $v0,4
	la $a0,msg4
	syscall

	li $t5,'\n'
	loopnew:
	la $t0,new
	f:
	lb $t1,0($t0)
	beq $t5,$t1,brk
	addi $t0,$t0,1
	j f
	brk:
	sb $zero,0($t0)

	la $t0,string
	la $t1,word
	li $t2,-1 #l
	li $t3,0 #f
	li $t6,' '
	search:
	lb $t4,0($t0)
	sb $t4,0($t1)
	addi $t2,$t2,1
	addi $t1,$t1,1
	addi $t0,$t0,1
	beq $t4,$t5,flag
	bne $t4,$t6,search

	find:
	la $t7,word
	add $t7,$t7,$t2
	sb $zero,0($t7)
	
	la $t7,replace
	la $t1,word
	for:
	lb $t4,0($t1)
	lb $t8,0($t7)
	beq $t8,$t5,found
	bne $t4,$t8,break1
	addi $t1,$t1,1
	addi $t7,$t7,1
	j for

	break1:
	li $v0,4
	la $a0,word
	syscall
	li $v0,4
	la $a0,space
	syscall
	L:
	li $t2,-1
	la $t1,word
	beq $zero,$t3,search
	j exit
	
	flag:
	addi $t3,$t3,1
	j find

	found:
	li $v0,4
	la $a0,new
	syscall
	li $v0,4
	la $a0,space
	syscall
	j L

	exit:
	li $v0,4
	la $a0,newline
	syscall
	li $v0,10
	syscall
	
	


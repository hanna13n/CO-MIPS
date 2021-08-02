.data
msg1:.asciiz "Enter the string: "
msg2:.asciiz "The Largest word: "
msg3:.asciiz "The Smallest word: "
newline:.asciiz "\n"
string: .space 100
word: .space 100
largeword: .space 100
smallword: .space 100


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
	
	la $t0,string
	la $t1,word
	li $t2,0 	#count of word length
	li $t3,0 	#largest word length
	li $t4,100 	#smallest word length
	li $t5,'\n'
	li $t6,0 #flag
	li $t7,' '
	for:
		lb $t8,0($t0)
		sb $t8,0($t1)
		beq $t8,$t7,reset1
		
		addi $t2,$t2,1
		addi $t1,$t1,1
		L2:
		addi $t0,$t0,1
		bne $t8,$t5,for
		addi $t6,$t6,1
		sub $t1,$t1,1
		
	reset1:
	sb $zero,0($t1)
	bgt $t2,$t3,large

	reset2:
	blt $t2,$t4,small
	
	reset3:
	li $t2,0
	la $t1,word
	beq $zero,$t6,L2
	j print
	
	large:
	move $t3,$t2
	la $s0,largeword
	la $s1,word
	move1:
	lb $t8,0($s1)
	sb $t8,0($s0)
	beq $t8,$zero,reset2
	addi $s1,$s1,1
	addi $s0,$s0,1
	j move1
	
	small:
	move $t4,$t2
	la $s0,smallword
	la $s1,word
	move2:
	lb $t8,0($s1)
	sb $t8,0($s0)
	beq $t8,$zero,reset3
	addi $s1,$s1,1
	addi $s0,$s0,1
	j move2

	print:
	li $v0,4
	la $a0,msg2
	syscall	
	
	li $v0,4
	la $a0,largeword
	syscall
	
	li $v0,4
	la $a0,newline
	syscall

	li $v0,4
	la $a0,msg3
	syscall

	li $v0,4
	la $a0,smallword
	syscall

	li $v0,4
	la $a0,newline
	syscall

exit:
li $v0,10
syscall





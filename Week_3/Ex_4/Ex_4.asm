.data
output:
	.asciiz "Length of string: "
buffer:
	.space 1000 # Reserve 1000 bytes for the string

.text
main:
	li $v0,8
	la $a0,buffer
	li $a1,1000
	syscall
	
	la $t0,buffer # Save the string to $t0
	li $t1,0 # $t1 contains the number of characters
	WHILE:
		lb $t2,($t0)
		beqz $t2,DONE # If the character is \0, we are done
		beq $t2,0x0a,DONE # or if the character is \n, we are done
		addi $t0,$t0,1
		addi $t1,$t1,1
		j WHILE
	
	DONE:
	li $v0,4
	la $a0,output
	syscall
	li $v0,1
	move $a0,$t1
	syscall
	
	li $v0,10
	syscall

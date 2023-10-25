.data
n:    .word 0           # To store the value of 'n'
array: .space 10         # Space for 10 integers (adjust as needed)
prompt_n: .asciiz "Enter the number of elements (n): "
prompt_input_open: .asciiz "a["
prompt_input_close: .asciiz "] = "

.text
.globl main

main:

	# load prompt
	li, $v0, 4
	la, $a0, prompt_n
	syscall

	# read n
	li, $v0, 5
	syscall
	sw $v0, n

	# init loop
	li $t0, 0

	#load array address
	la $t1, array

	input_loop:

	#a[
	li, $v0, 4
	la, $a0, prompt_input_open
	syscall

	#i
	li $v0, 1
	move $a0, $t0
	syscall

	#] = 
	li, $v0, 4
	la, $a0, prompt_input_close
	syscall

	#read a[i]
	li, $v0, 5
	syscall

	#store in array
	sw $v0, 0($t1)



	#loop counter add
	addi $t0, $t0, 1

	#move to array next address
	addi $t1, $t1, 4

	lw $t2, n
	beq $t0, $t2, end_input

	j input_loop

	end_input:

	li $t0, 0
	la $t1, array

	output_loop:

	lw $a0, 0($t1)
	#output a[i]
	li $v0, 1
	syscall

	#output the end line character
	li $v0, 11
	li $a0, 10
	syscall

	addi $t0, $t0, 1
	addi $t1, $t1, 4

	lw $t2, n
	beq $t0, $t2, exit
	j output_loop

	exit:

	li, $v0, 10
	syscall





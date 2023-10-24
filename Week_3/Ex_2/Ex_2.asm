.data
prompt: .asciiz "Input: "
uppercase: .asciiz "\nResult: uppercase"
lowercase: .asciiz "\nResult: lowercase"

.text
.globl main
main:
    # Print the prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Read a character
    li $v0, 12
    syscall

    # Check if the character is uppercase
    li $t0, 65
    blt $v0, $t0, invalid
    li $t0, 90
    bgt $v0, $t0, check_lowercase

    # Print 'uppercase'
    li $v0, 4
    la $a0, uppercase
    syscall
    j exit

check_lowercase:
    # Check if the character is lowercase
    li $t0, 97
    blt $v0, $t0, invalid
    li $t0, 122
    bgt $v0, $t0, invalid

    # Print 'lowercase'
    li $v0, 4
    la $a0, lowercase
    syscall
    j exit

invalid:
    # Print 'Invalid character'
    li $v0, 4
    la $a0, invalid
    syscall

exit:
    # Exit the program
    li $v0, 10
    syscall

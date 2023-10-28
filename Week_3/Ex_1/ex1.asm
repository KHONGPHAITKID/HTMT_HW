.data
a_lt_b:
    .asciiz "a < b"
a_gt_b:
    .asciiz "a > b"
a_eq_b:
    .asciiz "a = b"

.text
main:
    # Read the first integer from the user
    li $v0, 5
    syscall
    move $s0, $v0  # Store the first integer in $s0
    
    li $v0, 5
    syscall
    move $s1, $v0
    
    slt $t0,$s0,$s1
    bne $t0,$zero,LESS
    beq $s0,$s1,EQUAL
    j GREATER
    
    LESS:
    li $v0,4
    la $a0, a_lt_b
    syscall
    j EXIT
    
    EQUAL:
    li $v0,4
    la $a0,a_eq_b
    syscall
    j EXIT
    
    GREATER:
    li $v0,4
    la $a0,a_gt_b
    syscall

    # Exit the program
    EXIT:
    li $v0, 10
    syscall

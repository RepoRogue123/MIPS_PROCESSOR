# Program 2: Subtract two numbers and branch if result is zero

    addi $t0, $zero, 15        # $t0 = 15
    addi $t1, $zero, 15        # $t1 = 15
    sw   $t0, 0($zero)         # Store 15 at memory[0]
    sw   $t1, 4($zero)         # Store 15 at memory[4]
    lw   $t2, 0($zero)         # Load value 15 from memory[0] into $t2
    lw   $t3, 4($zero)         # Load value 15 from memory[4] into $t3
    sub  $t4, $t2, $t3         # $t4 = 15 - 15 = 0
    beq  $t4, $zero, SAME      # If result == 0, branch to SAME
    addi $t5, $zero, 1         # (Skipped since $t4 == 0)
SAME: sw   $t4, 8($zero)       # Store 0 at memory[8]
END:  beq  $zero, $zero, END   # Infinite loop

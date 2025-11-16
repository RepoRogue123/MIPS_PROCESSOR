# Program 1: Add two numbers from memory and store result

    addi $t0, $zero, 10        # $t0 = 10
    addi $t1, $zero, 20        # $t1 = 20
    sw   $t0, 0($zero)         # Store 10 at memory[0]
    sw   $t1, 4($zero)         # Store 20 at memory[4]
    lw   $t2, 0($zero)         # Load value 10 from memory[0] into $t2
    lw   $t3, 4($zero)         # Load value 20 from memory[4] into $t3
    add  $t4, $t2, $t3         # $t4 = 10 + 20 = 30
    sw   $t4, 8($zero)         # Store result (30) into memory[8]
END: beq  $zero, $zero, END    # Infinite loop to stop program
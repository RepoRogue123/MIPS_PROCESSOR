# Program 3: Bitwise operations using loaded memory data

    addi $t0, $zero, 6         # $t0 = 6 (0110)
    addi $t1, $zero, 3         # $t1 = 3 (0011)
    sw   $t0, 0($zero)         # Store 6 at memory[0]
    sw   $t1, 4($zero)         # Store 3 at memory[4]
    lw   $t2, 0($zero)         # Load 6 from memory[0] into $t2
    lw   $t3, 4($zero)         # Load 3 from memory[4] into $t3
    and  $t4, $t2, $t3         # $t4 = 6 AND 3 = 2
    or   $t5, $t2, $t3         # $t5 = 6 OR 3 = 7
    sw   $t4, 8($zero)         # Store AND result (2) at memory[8]
    sw   $t5, 12($zero)        # Store OR result (7) at memory[12]
END: beq  $zero, $zero, END    # Infinite loop

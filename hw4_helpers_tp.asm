.text

validKingMove:
	# Your code here
	li $v0, 222 #replace this line
	jr $ra
	
validQueenMove:
	# insert code here
	addi $sp, $sp, -16
        sw $s0, 0($sp)
        sw $s1, 4($sp)   
        sw $s2, 8($sp)
        sw $s3, 12($sp) 
	
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	move $s3, $a3
	
	addi $sp, $sp, -4
        sw $ra , 0($sp)
        move $a0, $s0
        move $a1, $s1
        move $a2, $s2
        move $a3, $s3
 	jal validBishopMove
        lw $ra , 0($sp)
        addi $sp, $sp, 4  
	
	li $t0, 1
	beq $v0, $t0, valid
	beq $v0, $zero, valid

	noway:
	addi $sp, $sp, -4
        sw $ra , 0($sp)
        move $a0, $s0
        move $a1, $s1
        move $a2, $s2
        move $a3, $s3
 	jal validRookMove
        lw $ra , 0($sp)
        addi $sp, $sp, 4  
        
        valid:
        lw $s3, 12($sp)
        lw $s2, 8($sp)
        lw $s1, 4($sp)
        lw $s0, 0($sp)
        addi $sp, $sp, 16
	jr $ra        

validKnightMove:
	# Your code here
	li $v0, 222 #replace this line
	jr $ra

validPawnMove:
	# Your code here
	li $v0, 222 #replace this line
	jr $ra

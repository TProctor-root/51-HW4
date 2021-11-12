.text

inner_recurse:
	# Your code here
        
	lw $t0, 0($sp)
	
	addi $sp, $sp, -28
        sw $s0, 0($sp)
        sw $s1, 4($sp)   
        sw $s2, 8($sp)
        sw $s3, 12($sp) 
        sw $s4, 16($sp)
        sw $s5, 20($sp) 
        sw $ra, 24($sp)
        
	move $s0, $t0
	move $s1, $a3
	move $s2, $a0
	
	li $v0, 34
	move $a0, $s2
	syscall

	addi $v0, $0, 4
	la $a0, comma
	syscall
		
	li $v0, 34
	move $a0, $a1
	syscall
	
	addi $v0, $0, 4
	la $a0, comma
	syscall
	
	li $v0, 34
	move $a0, $a2
	syscall
	
	addi $v0, $0, 4
	la $a0, endl
	syscall
	
	move $a0, $s2
	
	beq $a1, $s1, sol
	j inc
	
	sol:
	addi $v0, $0, 4
	la $a0, solution
	syscall
		
	addi $s0, $s0, 1

	lw $ra, 24($sp)
	lw $s5, 20($sp)
        lw $s4, 16($sp)
        lw $s3, 12($sp)
        lw $s2, 8($sp)
        lw $s1, 4($sp)
        lw $s0, 0($sp)
    
        addi $sp, $sp, 28
	jr $ra
	
	inc:
	
	or $t9, $a1, $a2
	or $t8, $t9, $s2 
	not $t7, $t8       #$t7 positive poss
	

	
	
	
	whileD:
	li $t1, 0
	
	sub $k1, $t1, $t7  #$k1 negative poss
	and $t2, $t7, $s1
        beqz $t2, endWhileD	
	
	and $t6, $t7, $k1
	sub $t7, $t7, $t6 
		
	or $t5, $s2, $t6
	srl $s3, $t5, 1 # $s3 in stack
	
	or $s4, $a1, $t6 # $s4 in stack
	
	or $t3, $a2, $t6
	sll $s5, $t3, 1 # $s5 in stack	
	move $t0, $s0
	
	addi $sp, $sp, -24
        sw $t0 , 0($sp)
        sw $a0 , 4($sp)
        sw $a1 , 8($sp)
        sw $a2 , 12($sp)
        sw $a3 , 16($sp)
        sw $ra , 20($sp)
        move $a0, $s3
        move $a1, $s4
        move $a2, $s5       
        move $a3, $s1
	jal inner_recurse
	sw $ra , 20($sp)
        lw $a3 , 16($sp)
	lw $a2 , 12($sp)
	lw $a1 , 8($sp)
	lw $a0 , 4($sp)
        lw $t0 , 0($sp)
        addi $sp, $sp, 24
	j whileD
	
	endWhileD:	
	 lw $ra, 24($sp)
	lw $s5, 20($sp)
        lw $s4, 16($sp)
        lw $s3, 12($sp)
        lw $s2, 8($sp)
        lw $s1, 4($sp)
        lw $s0, 0($sp)
        addi $sp, $sp, 28
	
	jr $ra
	
.data
endl: .asciiz "\n"
comma: .asciiz ", "
solution: .asciiz "Solution found!"

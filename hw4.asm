#.include "hw4_helpers.asm"
.include "hw4_helpers_tp.asm"
#.include "hw4_nqueens.asm"
.text

##########################################
#  Part #1 Functions
##########################################

initBoard:
	# insert code here
	sll $a1, $a1, 4
	sll $a2, $a2, 4
	or $k0, $a1, $a0 
	or $k1, $a2, $a0 
	
	li $t0, 0
	li $t1, 0
	li $t2, 64
	li $t3, 1
	
	li $t6, 0xffff0000

	square:
	li $t4, 8
	div $t0, $t4
	mfhi $t4
	bnez $t4, EvenRow
	xori $t1, $t1,  1
	EvenRow:
	beq $t0, $t2, circle
	beq $t3, $t1, light
	j dark
	light:
	sb $k1, 1($t6)
	li $t1, 0
	j newC
	
	dark:
	sb $k0, 1($t6)
	li $t1, 1
	newC:
	li $t7, 'E'
	sb $t7, 0($t6)
	addi $t6, $t6, 2
	addi $t0, $t0, 1
	j square
	circle:
	jr $ra

setSquare:
	# insert code here			
	lw $t0, 0($sp) # byte fg
	
	li $t1, 0xF
	
	bgt $t0, $t1, error 
	
	li $t2, -1
	li $t3, 8
	ble $a0, $t2, error
	bge $a0, $t3, error   	
	ble $a1, $t2, error
	bge $a1, $t3, error
	
        li $t2, 1
	li $t3, 2
	beq $a3, $t2, next
	beq $a3, $t3, next   		   	   		   	   	   
	
	error:
	li $v0, -1
	j skip
	
	next:				
	li $t1, 'E'
	beq $t1, $a2, setting
	li $t2, 1
	li $t3, 0
	beq $t2, $a3, white
	li $t0, 0
	j setting
	
	white:
	li $t0, 15 
	
	setting:
	li $t1, 8
	li $t2, 2
	
	mul $t3, $a0, $t1
	add $t4, $t3, $a1
	mul $t5, $t4, $t2
	
	li $t6, 0xffff0000
	
	add $t1, $t5, $t6
	
	lb $t7, 1($t1) 
	sb $a2, 0($t1)
	
	li $t9, 0xF0
	and $k0, $t7, $t9
	or $k1, $k0, $t0
	
	sb $k1, 1($t1)

	li $v0, 0
	
	skip:
	jr $ra

initPieces:
	# insert code here
	li $t0, 0

	addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 0
	li $a1, 0
	li $a2, 'R'
	li $a3, 2
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
	addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 0
	li $a1, 1
	li $a2, 'H'
	li $a3, 2
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 0
	li $a1, 2
	li $a2, 'B'
	li $a3, 2
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8

        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 0
	li $a1, 3
	li $a2, 'Q'
	li $a3, 2
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 0
	li $a1, 4
	li $a2, 'K'
	li $a3, 2
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 0
	li $a1, 5
	li $a2, 'B'
	li $a3, 2
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 0
	li $a1, 6
	li $a2, 'H'
	li $a3, 2
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 0
	li $a1, 7
	li $a2, 'R'
	li $a3, 2
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 1
	li $a1, 0
	li $a2, 'P'
	li $a3, 2
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 1
	li $a1, 1
	li $a2, 'P'
	li $a3, 2
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 1
	li $a1, 2
	li $a2, 'P'
	li $a3, 2
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 1
	li $a1, 3
	li $a2, 'P'
	li $a3, 2
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 1
	li $a1, 4
	li $a2, 'P'
	li $a3, 2
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 1
	li $a1, 5
	li $a2, 'P'
	li $a3, 2
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 1
	li $a1, 6
	li $a2, 'P'
	li $a3, 2
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 1
	li $a1, 7
	li $a2, 'P'
	li $a3, 2
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 6
	li $a1, 0
	li $a2, 'P'
	li $a3, 1
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 6
	li $a1, 1
	li $a2, 'P'
	li $a3, 1
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 6
	li $a1, 2
	li $a2, 'P'
	li $a3, 1
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 6
	li $a1, 3
	li $a2, 'P'
	li $a3, 1
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 6
	li $a1, 4
	li $a2, 'P'
	li $a3, 1
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 6
	li $a1, 5
	li $a2, 'P'
	li $a3, 1
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 6
	li $a1, 6
	li $a2, 'P'
	li $a3, 1
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 6
	li $a1, 7
	li $a2, 'P'
	li $a3, 1
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8      
        
	addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 7
	li $a1, 0
	li $a2, 'R'
	li $a3, 1
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
	addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 7
	li $a1, 1
	li $a2, 'H'
	li $a3, 1
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 7
	li $a1, 2
	li $a2, 'B'
	li $a3, 1
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8

        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 7
	li $a1, 3
	li $a2, 'Q'
	li $a3, 1
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 7
	li $a1, 4
	li $a2, 'K'
	li $a3, 1
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 7
	li $a1, 5
	li $a2, 'B'
	li $a3, 1
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 7
	li $a1, 6
	li $a2, 'H'
	li $a3, 1
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0 , 0($sp)
        li $a0, 7
	li $a1, 7
	li $a2, 'R'
	li $a3, 1
	jal setSquare
        lw $t0 , 0($sp)
        lw $ra , 4($sp)
        addi $sp, $sp, 8
	jr $ra

mapChessMove:
	# insert code here
	li $t0, '0'
	li $t7, '1'
	li $t1, 'A'
	
	li $t8, '8'
	li $t9, 'H'
	
	blt $a0, $t1, never
	blt $t9, $a0, never
		
	blt $a1, $t7, never
	blt $t8, $a1, never
	
	sub $k0, $a1, $t0  # Num
	li $t0, 8
	sub $k0, $t0, $k0
	sub $k1, $a0, $t1 # Alp
	
	sll $t3, $k0, 8
	or $t4, $t3, $k1
	
	move $v0, $t4
	j yeep
	
	never:
	li $t4, 0xFFFF
	move $v0, $t4
	
	yeep:
	jr $ra

loadGame:
	# insert code here
        addi $sp, $sp, -16
        sw $s0, 0($sp)
        sw $s1, 4($sp)   
        sw $s6, 8($sp)
        sw $s7, 12($sp) 
    
	li $v0, 13
	move $a0, $a0
	li $a1, 0
	li $a2, 0
	syscall
	
	move $s1, $v0
	
	bgt $s1, $zero, fileReadSucess
	li $v0, -1
	li $v1, -1
	j fileReadError 
	
	fileReadSucess:
	addi $sp, $sp, -16
        move $s0, $sp
	
	li $s7, 0
	li $s6, 0
	loop:
	
	move $a0, $s1
	li $a2, 5
	move $a1, $s0
        li $v0, 14
	syscall	
	
	ble $v0, $zero, loopEnd
	
	lb $a0, 2($s0)
	lb $a1, 3($s0)
        
        addi $sp, $sp, -4
        sw $ra , 0($sp)
	jal mapChessMove
        lw $ra , 0($sp)
        addi $sp, $sp, 4
        
	lb $a2, 1($s0)
	lb $a3, 0($s0)
	addi $a3, $a3, -0x30
	
	li $a1, 0xFF
	and $a1, $a1, $v0
        move $a0, $v0
        srl $a0, $a0, 8
 
 	li $t7, 1
        beq $a3, $t7, count
        addi $s6, $s6, 1
        j cont
        
        count:
        addi $s7, $s7, 1
       
        cont:
        li $t0, 0x01        
        addi $sp, $sp, -8
        sw $ra , 4($sp)
        sw $t0, 0($sp)
	jal setSquare
        lw $ra , 4($sp)
        lw $t0, 0($sp)
        addi $sp, $sp, 8
	j loop
	loopEnd:
	
	li $v0, 16
	move $a0, $s1
	syscall	
	
	move $v0, $s7 
	move $v1, $s6
	addi $sp, $sp, 16
	
	fileReadError:
	lw $s7, 12($sp)
        lw $s6, 8($sp)
        lw $s1, 4($sp)
        lw $s0, 0($sp)
        addi $sp, $sp, 16
	jr $ra

##########################################
#  Part #2 Functions
##########################################

getChessPiece:
	# insert code here
	srl $t0, $a0, 8
	li $t1, 0x00FF
	and $t2, $a0, $t1

	li $t3, 8
	li $t6, 2
	
	mul $t4, $t3, $t0
	add $t5, $t2, $t4
	mul $t7, $t5, $t6
	
	li $t9, 0xffff0000
	add $t8, $t7, $t9
	
	lb $k0, ($t8)
	
	li $k1, 'E'
	li $t9, 0x0F
	beq $k0, $k1, mistake
	lb $t0, 1($t8)
	and $t1, $t9, $t0
	li $t7, 15

	beq $t1, $t7, player1
	li $v1, 2
	move $v0, $k0
	j found
	
	player1:
	li $v1, 1
	move $v0, $k0
	found:
	j okay
	
	mistake:
	li $v0, 'E' 
	li $v1, -1 
	
	okay:
	jr $ra

validBishopMove:
	# insert code here
	addi $sp, $sp, -24
        sw $s0, 0($sp)
        sw $s1, 4($sp)   
        sw $s2, 8($sp)
        sw $s3, 12($sp) 
        sw $s4, 16($sp)
        sw $s5, 20($sp)         
        
	beq $a0, $a1, wrong

	li $t0, 1
	li $t1, 2
	beq $t0, $a2, river2
	beq $t1, $a2, river2
	j itsYou2
	
	river2:
	srl $s0, $a0, 8
	li $t1, 0x00FF
	and $s2, $a0, $t1

	li $t3, 8
	li $t6, 2

	srl $s1, $a1, 8
	and $s3, $a1, $t1
	
	addi $sp, $sp, -20
        sw $ra , 0($sp)
        sw $a0 , 4($sp)
        sw $a1 , 8($sp)
        sw $a2 , 12($sp)
        sw $a3 , 16($sp)
        move $a0, $a1
	jal getChessPiece
        lw $a3 , 16($sp)
	lw $a2 , 12($sp)
	lw $a1 , 8($sp)
	lw $a0 , 4($sp)
        lw $ra , 0($sp)
        addi $sp, $sp, 20
        
        beq  $a2, $v1, wrong
        li $k1, 'E'
        beq $v0, $k1, correct
        move $s4, $v0
        li $s5, 1
        j moveon
        
        correct:
        li $s4, '\0'
        li $s5, 0
        
        moveon:
        ###########################################
        li $t0, 1
        li $t1, 1
        
        bgt $s0, $s1, rowI
        j c
        
        rowI:
        li $t0, -1
        
        c:
        bgt $s2, $s3, colI
	j bye
        colI:
        li $t1, -1
	
	bye:
	sub $t5, $s0, $s1
	sub $t6, $s2, $s3
	mul $t5, $t5, $t0
	mul $t6, $t6, $t1
	bne $t6, $t5, wrong
	###########################################
	doLo:
	add $s0, $s0, $t0
	add $s2, $s2, $t1
	beq $s0, $s1, good
	beq $s2, $s3, good
	good:
	beq $s3, $s2, fine
	
	addi $sp, $sp, -28
        sw $ra , 0($sp)
        sw $a0 , 4($sp)
        sw $a1 , 8($sp)
        sw $a2 , 12($sp)
        sw $a3 , 16($sp)
        sw $t0 , 20($sp)
        sw $t1 , 24($sp)
        sll $t3, $s0, 8
	or $a0, $t3, $s2
	jal getChessPiece
	lw $t1 , 24($sp)
	lw $t0 , 20($sp)
	lw $a3 , 16($sp)
	lw $a2 , 12($sp)
	lw $a1 , 8($sp)
	lw $a0 , 4($sp)
        lw $ra , 0($sp)
        addi $sp, $sp, 28
        
        li $k0, 'E'
        bne $k0, $v0, wrong 				
	j doLo
	
	fine:
	move $v0, $s5
	move $v1, $s4
	beqz $v0, skipLine
	sh $a1, ($a3)
	
	skipLine:
	j fire
	
	wrong:
	li $v0, -1
	li $v1, 0
	j fire
	
	itsYou2:
	li $v0, -2
	li $v1, 0	

	fire:
	lw $s5, 20($sp)
        lw $s4, 16($sp)
        lw $s3, 12($sp)
        lw $s2, 8($sp)
        lw $s1, 4($sp)
        lw $s0, 0($sp)
        addi $sp, $sp, 24
	jr $ra

validRookMove:
	addi $sp, $sp, -24
        sw $s0, 0($sp)
        sw $s1, 4($sp)   
        sw $s2, 8($sp)
        sw $s3, 12($sp) 
        sw $s4, 16($sp)
        sw $s5, 20($sp) 
        
	beq $a0, $a1, incorrect
	
	li $t0, 1
	li $t1, 2
	beq $t0, $a2, river
	beq $t1, $a2, river
	j itsYou
	
	river:
	srl $s0, $a0, 8
	li $t1, 0x00FF
	and $s2, $a0, $t1

	li $t3, 8
	li $t6, 2

	srl $s1, $a1, 8
	and $s3, $a1, $t1
	
	addi $sp, $sp, -20
        sw $ra , 0($sp)
        sw $a0 , 4($sp)
        sw $a1 , 8($sp)
        sw $a2 , 12($sp)
        sw $a3 , 16($sp)
        move $a0, $a1
	jal getChessPiece
        lw $a3 , 16($sp)
	lw $a2 , 12($sp)
	lw $a1 , 8($sp)
	lw $a0 , 4($sp)
        lw $ra , 0($sp)
        addi $sp, $sp, 20
        
        beq $a2, $v1, incorrect
        li $k1, 'E'
        beq $v0, $k1, stayCool
        move $s4, $v0
        li $s5, 1
        j movingon
        
        stayCool:
        li $s4, '\0'
        li $s5, 0
        
        movingon:    
        ###########################################
        li $t0, 1
        li $t1, 1
        
        beq $s1, $s0, rowID
        j colID
        
        rowID:
        li $t0, 0
        bgt $s2, $s3, arrow
        j soy       
        
        arrow:
        li $t1, -1
	j soy
        
        colID:
        beq $s3, $s2, equal
        j incorrect
        
        equal:
        li $t1, 0
        bgt $s0, $s1, sharp       
        j soy

	sharp:
	li $t0, -1
	
	soy:
	###########################################	
	doLo2:
	add $s0, $s0, $t0
	add $s2, $s2, $t1
	bne $s0, $s1, goody		
	bne $s2, $s3, goody
	j fineo
	
	goody:	
	addi $sp, $sp, -28
        sw $ra , 0($sp)
        sw $a0 , 4($sp)
        sw $a1 , 8($sp)
        sw $a2 , 12($sp)
        sw $a3 , 16($sp)
        sw $t0 , 20($sp)
        sw $t1 , 24($sp)
        sll $t3, $s0, 8
	or $a0, $t3, $s2
	jal getChessPiece
	lw $t1 , 24($sp)
	lw $t0 , 20($sp)
	lw $a3 , 16($sp)
	lw $a2 , 12($sp)
	lw $a1 , 8($sp)
	lw $a0 , 4($sp)
        lw $ra , 0($sp)
        addi $sp, $sp, 28
        
        li $k0, 'E'
        bne $k0, $v0, incorrect				
	j doLo2
	
	fineo:
	move $v0, $s5
	move $v1, $s4
	beqz $v0, skipLine2
	sh $a1, ($a3)
	
	skipLine2:
	j burn
	
	incorrect:
	li $v0, -1
	li $v1, 0
	j burn
	
	itsYou:
	li $v0, -2
	li $v1, 0	

	burn:
	lw $s5, 20($sp)
        lw $s4, 16($sp)
        lw $s3, 12($sp)
        lw $s2, 8($sp)
        lw $s1, 4($sp)
        lw $s0, 0($sp)
        addi $sp, $sp, 24
	jr $ra

perform_move:
        lw $t0 , 0($sp)
        #register convention
      
	addi $sp, $sp, -20
        sw $s0, 0($sp)
        sw $s1, 4($sp)   
        sw $s3, 8($sp)
        sw $s4, 12($sp) 
        sw $s5, 16($sp)
      
       	move $s1, $t0	
       	addi $sp, $sp, -4
	move $s3, $sp	
	li $t1, -1
	li $t2, 8
	bge $t1, $a1, bad2
	ble $a1, $t2, bad2
	bge $t1, $a2, bad2
	ble $a2, $t2, bad2
	
	addi $sp, $sp, -20
        sw $ra , 0($sp)
        sw $a0 , 4($sp)
        sw $a1 , 8($sp)
        sw $a2 , 12($sp)
        sw $a3 , 16($sp)
        move $a0, $a1
	jal getChessPiece
        lw $a3 , 16($sp)
	lw $a2 , 12($sp)
	lw $a1 , 8($sp)
	lw $a0 , 4($sp)
        lw $ra , 0($sp)
        addi $sp, $sp, 20
        move $s0, $v0
        li $t0, 'E'
        beq $t0, $v0, bad
	bne $v1, $a0, bad

	li $t0, 'P'
	li $t1, 'p'
	li $t2, 'R'
	li $t3, 'H'
	li $t4, 'B'
	li $t5, 'Q'
	li $t6, 'K'
	
	beq $s0, $t4, bishop
	j afterlife
	
	bishop:
	addi $sp, $sp, -20
        sw $ra , 0($sp)
        sw $a0 , 4($sp)
        sw $a1 , 8($sp)
        sw $a2 , 12($sp)
        sw $a3 , 16($sp)
        move $t7, $a0
        move $a0, $a1
        move $a1, $a2
        move $a3, $s3 
        move $a2, $t7
	jal validBishopMove
        lw $a3 , 16($sp)
	lw $a2 , 12($sp)
	lw $a1 , 8($sp)
	lw $a0 , 4($sp)
        lw $ra , 0($sp)
        addi $sp, $sp, 20
        
        li $t0, 0
        blt $v0, $t0 , bad 
        j validmove
        
        afterlife:
        beq $s0, $t2, rook
        j afterlife2
        
	rook:
	addi $sp, $sp, -20
        sw $ra , 0($sp)
        sw $a0 , 4($sp)
        sw $a1 , 8($sp)
        sw $a2 , 12($sp)
        sw $a3 , 16($sp)
        move $t7, $a0
        move $a0, $a1
        move $a1, $a2
        move $a3, $s3 
        move $a2, $t7
	jal validRookMove
        lw $a3 , 16($sp)
	lw $a2 , 12($sp)
	lw $a1 , 8($sp)
	lw $a0 , 4($sp)
        lw $ra , 0($sp)
        addi $sp, $sp, 20
        
        li $t0, 0
   
        blt $v0, $t0 , bad 
        j validmove
        
	afterlife2:
        beq $s0, $t0, pawn
        beq $s0, $t1, pawn
        j afterlife3
        
	pawn:
	li $s0, 'P' 
	addi $sp, $sp, -20
        sw $ra , 0($sp)
        sw $a0 , 4($sp)
        sw $a1 , 8($sp)
        sw $a2 , 12($sp)
        sw $a3 , 16($sp)
        move $t7, $a0
        move $a0, $a1
        move $a1, $a2
        move $a3, $s3 
        move $a2, $t7
	jal validPawnMove
        lw $a3 , 16($sp)
	lw $a2 , 12($sp)
	lw $a1 , 8($sp)
	lw $a0 , 4($sp)
        lw $ra , 0($sp)
        addi $sp, $sp, 20
        
        li $t0, 0
   
        blt $v0, $t0 , bad 
        j validmove	
	
	afterlife3:
        beq $s0, $t3, horse
        j afterlife4
        
	horse:
	addi $sp, $sp, -20
        sw $ra , 0($sp)
        sw $a0 , 4($sp)
        sw $a1 , 8($sp)
        sw $a2 , 12($sp)
        sw $a3 , 16($sp)
        move $t7, $a0
        move $a0, $a1
        move $a1, $a2
        move $a3, $s3 
        move $a2, $t7
	jal validKnightMove
        lw $a3 , 16($sp)
	lw $a2 , 12($sp)
	lw $a1 , 8($sp)
	lw $a0 , 4($sp)
        lw $ra , 0($sp)
        addi $sp, $sp, 20
        
        li $t0, 0
   
        blt $v0, $t0 , bad 
        j validmove
	
	afterlife4:
        beq $s0, $t5, queen
        j afterlife5
        
	queen:
	addi $sp, $sp, -20
        sw $ra , 0($sp)
        sw $a0 , 4($sp)
        sw $a1 , 8($sp)
        sw $a2 , 12($sp)
        sw $a3 , 16($sp)
        move $t7, $a0
        move $a0, $a1
        move $a1, $a2
        move $a3, $s3 
        move $a2, $t7
	jal validQueenMove
        lw $a3 , 16($sp)
	lw $a2 , 12($sp)
	lw $a1 , 8($sp)
	lw $a0 , 4($sp)
        lw $ra , 0($sp)
        addi $sp, $sp, 20
        
        li $t0, 0
   
        blt $v0, $t0 , bad 
        j validmove	
	
	afterlife5:
        beq $s0, $t6, king
        j bad
        
	king:
	addi $sp, $sp, -20
        sw $ra , 0($sp)
        sw $a0 , 4($sp)
        sw $a1 , 8($sp)
        sw $a2 , 12($sp)
        sw $a3 , 16($sp)
        move $t7, $a0
        move $a0, $a1
        move $a1, $a2
        move $a3, $s3 
        move $a2, $t7
	jal validKingMove
        lw $a3 , 16($sp)
	lw $a2 , 12($sp)
	lw $a1 , 8($sp)
	lw $a0 , 4($sp)
        lw $ra , 0($sp)
        addi $sp, $sp, 20
        
        li $t0, 0
   
        blt $v0, $t0 , bad
        sh $a2, ($s1) #update the kings position
        j validmove  
       	
        validmove:
        move $t0, $a2
        addi $sp, $sp, -20        
        sw $a1 , 4($sp)
        sw $a2 , 8($sp)
        sw $a3 , 0($sp)
        sw $a0 , 12($sp)
        sw $ra , 16($sp)
        move $a0, $t0
        jal getChessPiece
        lw $ra , 16($sp)
        lw $a0 , 12($sp)
	lw $a3 , 0($sp)
	lw $a2 , 8($sp)
	lw $a1 , 4($sp)
        addi $sp, $sp, 20
        
        li $t0, 'E'
        beq $v0, $t0, skiperoo
        move $s4, $v0
        li $s5, 1
        j skipskip
        
        skiperoo:
        li $s4, '\0'
        li $s5, 0
        
        skipskip:
        srl $t0, $a2, 8
	li $t1, 0x00FF
	and $t2, $a2, $t1

	addi $sp, $sp, -20        
        sw $a1 , 4($sp)
        sw $a2 , 8($sp)
        sw $a3 , 0($sp)
        sw $a0 , 12($sp)
        sw $ra , 16($sp)
        move $a3, $a0
        move $a0, $t0
        move $a1, $t2
        move $a2, $s0
	jal setSquare
        lw $ra , 16($sp)
        lw $a0 , 12($sp)
	lw $a3 , 0($sp)
	lw $a2 , 8($sp)
	lw $a1 , 4($sp)
        addi $sp, $sp, 20
        
        srl $t0, $a1, 8
	li $t1, 0x00FF
	and $t2, $a1, $t1
	li $t3, 'E'
	
	addi $sp, $sp, -20        
        sw $a1 , 4($sp)
        sw $a2 , 8($sp)
        sw $a3 , 0($sp)
        sw $a0 , 12($sp)
        sw $ra , 16($sp)
        move $a3, $a0
        move $a0, $t0
        move $a1, $t2
        move $a2, $t3
	jal setSquare
        lw $ra , 16($sp)
        lw $a0 , 12($sp)
	lw $a3 , 0($sp)
	lw $a2 , 8($sp)
	lw $a1 , 4($sp)
        addi $sp, $sp, 20
	
	move $v0, $s5
	move $v1, $s4
	j end
	
	bad:
	li $v0, -1
	li $v1, '\0'
	j end
	
	bad2:
	li $v0, -2
	li $v1, '\0'
	
	end:
	addi $sp, $sp, 4

	lw $s5 16($sp)	
	lw $s4 12($sp)
        lw $s3, 8($sp)
        lw $s1, 4($sp)
        lw $s0, 0($sp)
        addi $sp, $sp, 20	
	jr $ra

##########################################
#  Part #3 Function
##########################################

check:
	addi $sp, $sp, -24
        sw $s0, 0($sp)
        sw $s1, 4($sp)   
        sw $s4, 8($sp)
        sw $s5, 12($sp) 
        sw $s6, 16($sp)
        sw $s7, 20($sp)    
        
        addi $sp, $sp, -4
        lw $t0 , 0($sp)	
	
	li $t1, 1
	li $t2, 2
	beq $a0, $t1, pass
	beq $a0, $t2, pass
	li $v0, -2
	j happy
	
	pass:
	li $t1, 0x00FF
	srl $t0, $a1, 8
	and $t1, $t1, $a1
	li $t2, 8
	li $t3, 0
	blt $t0, $t3, fPass
	bgt $t1, $t2, fPass
	bgt $t0, $t2, fPass
	blt $t1, $t3, fPass	
	j stone
	
	fPass:
	li $v0, -2
	j happy
	
	stone:	
	move $s0, $a0
	move $s1, $a1
	li $s6, -1
	li $s7, 8	
	
	finding:
	addi $s6, $s6, 1 # j row
	beq $s6, $s7, endLooking
	li $s5, -1
	
	looking:
	addi $s5, $s5, 1 # k col
	li $k0, 8
	beq $s5, $k0, finding
	sll $t6, $s6, 8 
	or $s4, $t6, $s5
	move $a0, $s4
	
	addi $sp, $sp, -8
        sw $ra , 0($sp)
	jal getChessPiece
        lw $ra , 0($sp)
        addi $sp, $sp, 8
        
        bne $s0, $v1, looking
        
        li $t0, 'P'
        li $t1, 'p'
        li $t2, 'Q'
        li $t3, 'B'
        li $t4, 'K'
        li $t5, 'R'
        li $t6, 'H'
        move $a3, $sp
        move $a0, $s4
        move $a1, $s1        
        move $a2, $s0      
        
        beq $t0, $v0, pawnE
        beq $t1, $v0, pawnE
        beq $t2, $v0, queenE
        beq $t3, $v0, bishopE
        beq $t4, $v0, kingE
        beq $t5, $v0, rookE   
        beq $t6, $v0, horseE
        j looking
        
        kingE:
        addi $sp, $sp, -4
	sw $ra , 0($sp)
	jal validKingMove
        lw $ra , 0($sp)
        addi $sp, $sp, 4
        j capture
        
        pawnE:
	addi $sp, $sp, -4
	sw $ra , 0($sp)
	jal validPawnMove
        lw $ra , 0($sp)
        addi $sp, $sp, 4
        j capture
        
        queenE:
	addi $sp, $sp, -4
        sw $ra , 0($sp)
 	jal validQueenMove
        lw $ra , 0($sp)
        addi $sp, $sp, 4           
        j capture
                
        bishopE:
	addi $sp, $sp, -4
        sw $ra , 0($sp)
	jal validBishopMove
        lw $ra , 0($sp)
        addi $sp, $sp, 4            
        j capture
                
	horseE:
	addi $sp, $sp, -4
        sw $ra , 0($sp)
	jal validKnightMove
        lw $ra , 0($sp)
        addi $sp, $sp, 4  
        j capture
                  
	rookE:
	addi $sp, $sp, -4
        sw $ra , 0($sp)
	jal validRookMove
        lw $ra , 0($sp)
        addi $sp, $sp, 4     
  
        capture:
        li $t0, 0
        bge $v0, $t0, checkChess       
        j looking
        
        endLooking:
        li $v0, -1
        j happy

	checkChess:
	li $v0, 0
     
        happy:
	addi $sp, $sp, 4
	lw $s7, 20($sp)
        lw $s6, 16($sp)
        lw $s5, 12($sp)
        lw $s4, 8($sp)
        lw $s1, 4($sp)
        lw $s0, 0($sp)
        addi $sp, $sp, 24
	jr $ra

.data
str: .word 2,6,3,8,4,5
newLine: .asciiz "\n"
.text
.globl __start
__start: # execution starts here
la $a0,str
lw $t0, 0($a0)
la $a1,str
la $a3,str
addi $a1, $a1, 20
la $a2, str
addi $a2, $a2, 4
la $t7, str
addi $t7, $t7, 24
sort:	beq $a2,$t7,cero
	lw $t1, 0($a1)
	jal max
	beq $a2,$a1, so
	addi $a1, $a1, -4
	j sort

max:	bge $t1,$t0, change
	jr $ra
	
change: sw $t1, 0($a0)
	sw $t0, 0($a1)
	lw $t0, 0($a0)
	jr $ra
 
so:	la $a1,str
	addi $a1, $a1, 20
	addi $a0,$a0,4
	lw $t0, 0($a0)
	addi $a2,$a2,4
	jr $ra
	
cero:
	addi $t6, $zero, 24
	j done

done: 	la $a2, str
	lw $t8, 0($a2)
	la $a1, str
	addi $a1, $a1, 20
	jal while
	
while:	beq $a2, $a1, exit
	move $a0, $t8
	li $v0, 1
	syscall
	la $s2, newLine
	move $a0, $s2
	li $v0, 4
	syscall
	addi $a2, $a2, 4
	lw $t8, 0($a2)
	j while
	
	
exit:	li $v0, 10
	syscall
	

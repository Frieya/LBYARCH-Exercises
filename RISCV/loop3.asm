.globl	main

.macro ret0
	li a7, 10
	ecall
.end_macro	

.data	
	kpos: .word 0
	kneg: .word 0 
	posmsg1: .asciz "Number of positive is"
	negmsg1: .asciz  "Number of negative is"
	num1: .word 100, +200, -500,+1,-2,-3,-1
	
.text
main: 
	addi s1, x0, 0   #s1 - positive counter
	addi s2, x0, 0 #s2 - negative counter
	la t1, num1  #t1 - pointer 
	addi s3, x0, -1
	lw a0, (t1)  #a0 - are the elements
again:
	bgt a0, x0, funcpos
	bltz a0, funcneg
funcpos:
	addi s1, s1, 1
	addi t1, t1 4
	lw a0, (t1)  #a0 - are the elements
	beq a0, s3, tapos
	J again
funcneg:
	addi s2, s2, 1
	addi t1, t1 4
	lw a0, (t1)  #a0 - are the elements
	beq a0, s3, tapos
	J again
tapos: 
	la s5, kpos
	sw s1,(s5) #store answer
	la s6, kneg
	sw s2,(s6) 
	call printf
	ret0
	
printf:
	la s1, kpos
	lw a1, (s1)
	la a0, posmsg1
	li a7, 56
	ecall
	la s2, kneg
	lw a1, (s2)
	la a0, negmsg1
	li a7, 56
	ecall
	ret
	
	


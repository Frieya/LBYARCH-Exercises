.globl	main

.macro ret0
	li a7, 10
	ecall
.end_macro	

.data	
	num1: .word 5,4,2,1,-1
	sagot: .word 0
.text
main: 
	addi s1, x0, 0   #s1 - accumulator (sagot)
	addi t2,x0,-1 #t2 is 
	la t1, num1  #t1 - pointer 
again:
	lw a0, (t1)       #a0 - are the elements
	beq a0,t2,tapos #are you -1?
	add s1,s1, a0 #s1<----s1+a0
	addi t1, t1, 4
	j again
	
tapos: 
	la t1, sagot
	sw s1,(t1) #store answer
	call printf
	ret0
	
printf:
	la t1, sagot
	lw a0, (t1)
	li a7, 1
	ecall
	ret
	
	


.globl	main

.macro ret0
	li a7, 10
	ecall
.end_macro	

.data	
	num1: .word 2
	num2: .word 3
.text
main: 
	addi x6, x0, 5
	addi x7, x0, -1
	blt x6,x7,L1
	addi x10, x0, 9
	J tapos
L1: addi x10, x0, 5
tapos: 
	mv a0, x10
	li a7, 1
	ecall
	ret0
	
	
	


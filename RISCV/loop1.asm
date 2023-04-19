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
	addi x6, x0, 5 #x6=5 unsigned:5
	addi x7, x0, -1 #x7=-1[FFFFFFFF] unsigned: big number
	bltu x6,x7,L1 if #x6<x7 goto L1
	addi x10, x0, 9 #else
	J tapos #bypass short circuit
L1: addi x10, x0, 5   #less than here
tapos: 
	mv a0, x10
	li a7, 1
	ecall
	ret0
	
	
	


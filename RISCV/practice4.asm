.globl	main

.macro ret0
	li a7, 10
	ecall
.end_macro	
.macro newline
	li a7, 11
	li a0, 10
	ecall
.end_macro 
.macro print_float(%x)
	fmv.s fa0, %x
	li a7, 2
	ecall 
.end_macro 
.macro print_string(%x)
	la a0, %x
	li a7, 4
	ecall 
.end_macro 
.data

.text
main:
	li a7, 5
	ecall
	mv t1, a0
	li t5, 0
again:
	li t2, 2
	li t3, 1
	rem t4, t1, t2
	beq t3, t4, tapos
	div t1, t1, t2
	addi t5, t5, 1
	j again
tapos:
	li a7, 1
	mv a0, t5
	ecall
	

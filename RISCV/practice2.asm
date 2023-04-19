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
.data	
	num_list: .word 11,12,13,14,15,16,17,18,19,20
.text
main: 
	la s2, num_list
	j sub_main

sub_main:
	lw s3, (s2)
	addi s4, x0, 2
	rem t2, s3, s4
	beq t2, x0, even_func
	mul a0, s3,s4
	li a7, 1
	ecall
	newline
	j ifdone_func
	
even_func:
	div a0, s3, s4
	li a7, 1
	ecall
	newline
	j ifdone_func
	
ifdone_func:
	addi s5, x0, 20
	beq s3, s5, tapos
	addi s2, s2, 4
	j sub_main
	
tapos: 
	ret0
	
	
	


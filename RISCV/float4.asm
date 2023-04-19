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
	var1: .float NaN
	var2: .float -Inf
	truemsg: .asciz "true \n"
	falsemsg: .asciz "false \n"
.text
main:
	la t1, var1
	la t2, var2
	flw f2, (t2)
	flw f1, (t1) #load 4.00
	
	fclass.s x10, f2
	mv a0, x10
	li a7, 35
	ecall
	newline
	
	ret0
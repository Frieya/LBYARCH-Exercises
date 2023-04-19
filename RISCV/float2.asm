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
	var1: .float 4.5
	var2: .word 10 
	msg: .asciz "---- Breakpoint ----- \n"
.text
main:
	la t1, var1
	la t2, var2
	lw x10, (t2)
	
	
	fcvt.s.w f1, x10 # covert int to float int=10 fp=412000000
	print_float(f1)
	newline
	
	flw f1, (t1) #load 4.00
	fcvt.w.s x10, f1 #convert fp=4.0 -> int=4 w=int s-single precision
		li a7, 34
		mv, a0, x10
		ecall
		newline
	
	fmv.x.s x11, f1 #move fp=4.0; int=4080 0000
		li a7, 34
		mv, a0, x11
		ecall
		newline



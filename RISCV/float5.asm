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
	var1: .float 2.5, 3.5, 5.5, 4.5, 0.0
	fsum: .float 0.0
	msg: .asciz "sagot is: "
.text
main:
	#li x5, 5
	fcvt.s.w f10, x0  #f1 = 0.0
	fcvt.s.w f0, x0 #f0= sagot (aka accumulator)	
	la t1, var1
	la t2, fsum
again:
	flw f1, (t1) # elements to be added
	feq.s x10, f1, f10 # if f1 equal f10: x10== 1 
	bnez x10, tapos
	fadd.s f0, f0, f1 # ans = ans + element
	addi t1, t1, 4
	J again
tapos:
	fsw f0, (t2)
	#print dialog box
	li a7, 60 #dialog for float
	la a0, msg
	fmv.s fa1, f0
	ecall
	newline
	ret0
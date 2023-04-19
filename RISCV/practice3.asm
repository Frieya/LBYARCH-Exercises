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
	var1: .float 2.0, 2.0, 2.0, 2.0, -1.0
	var2: .float 2.0, 2.0, 2.0, 2.0, -1.0
	fsum: .float 0.0
	msg: .asciz "sagot is: "
.text
main:
	flw f1, fsum, t1
	la t2, var1
	la t3, var2
	li t4, -1
	fcvt.s.w f2, t4
loop:
	flw f3, (t2)
	flw f4, (t3)
	feq.s t5, f2, f3
	seqz t5, t5
	beqz t5, tapos
	fmul.s f5, f3, f4
	fadd.s f1, f1, f5
	addi t2, t2, 4
	addi t3, t3, 4
	j loop
tapos:
	fmv.s fa0, f1
	li a7, 2
	ecall
	ret0
	

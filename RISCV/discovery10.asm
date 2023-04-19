.globl	main
.macro newline
	li a7, 11
	li a0, 10
	ecall
.end_macro 
.macro ret0
	li a7, 10
	ecall
.end_macro
.data
LIST: .float 1.5, 2.5, 3.5, 0.0
no_msg: .asciz "number of elements: "
quad_mean_msg: .asciz "the quadratic mean: "
.text
main:
	la t1, LIST
	addi t4, x0, 1
	add t2, x0, x0 #number of float 
	fcvt.s.w f1, x0
	fadd.s f2,f1,f1
again:
	flw f3, (t1)
	feq.s t3, f3, f2
	beq t3, t4, end 
	fmadd.s f1, f3, f3, f1
	addi t2, t2, 1
	addi t1, t1,4
	j again
end:
	fcvt.s.w f4, t2
	fdiv.s  fa1, f1, f4
	fsqrt.s fa1, fa1
	mv a1, t2
	la a0, no_msg
	li a7, 56
	ecall
	la a0, quad_mean_msg
	li a7, 60
	ecall
	

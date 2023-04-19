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
.macro dialog_box_string(%x, %y)
	li a7, 59
	la a0, %x
	la a1, %y
	ecall
.end_macro 
.macro print_term(%x, %y)
	li a7, 4
	la a0, term_msg
	ecall
	li a7, 1
	mv a0, %y
	addi a0, a0, 1
	ecall
	li a7, 11
	li a0, 58
	ecall
	li a7, 11
	li a0, 32
	ecall
	li a7, 2
	fmv.s fa0, %x
	ecall
	li a7, 11
	li a0, 10
	ecall
.end_macro 
.data
x: .float 1.5708
max_n: .word 6
term_msg: .string "Term "
msg: .asciz "The hyperbolic sine of the given radian number is: "
function_msg1: .asciz  "HYPERBOLIC\n"
function_msg2: .asciz   "SINE FUNCTION"
.text
main:	
	dialog_box_string(function_msg1, function_msg2)
	la s1, x  #John Wesley Abe S12
	lw s3, max_n #load value of max_n to s3
	li s4, 0
	fcvt.s.w f7, x0
term:
	flw f1, (s1) # load x to f1
	#2n-1
	addi t1,x0, 2
	mul t2, s4, t1
	addi t2, t2, 1
	mv t3, t2
	mv t4, t2
	fcvt.s.w f2, x0
	fadd.s f2, f2, f1
	exponential: 
		addi t2, t2, -1
		beqz t2, factorial
		fmul.s f2, f2, f1
		j exponential
	factorial:
		addi t3, t3, -1
		beqz t3, div_step
		mul t4, t3, t4
		j factorial
	div_step:
		fcvt.s.w f3, t4
		fdiv.s f4, f2, f3
		print_term(f4, s4)
		newline
		fadd.s f7, f7,f4
	addi s4, s4, 1
	beq s4, s3, tapos
	j term
tapos:
	fmv.s fa1, f7
	li a7, 60
	la a0, msg
	ecall


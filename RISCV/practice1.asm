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
	err_msg: .string "The year you have provided is not divisible by 4"
	olympic_msg: .string "The number of olypmic tournment occured is: "
.text
main:
	li t0, 4
	li a7, 5
	ecall
	mv t1, a0
	rem t3, t1, t0
	beqz t3, second
	li a7, 55
	la a0, err_msg
	ecall
	j tapos
second:
	li a7, 5
	ecall
	mv t2, a0
	rem t3, t2, t0
	beqz t3, end
	li a7, 55
	la a0, err_msg
	ecall
	j tapos
end:
	sub t4, t1, t2
	div t5, t4, t0
	bltz t5, abs
	li a7, 56
	la a0, olympic_msg
	mv a1, t5
	ecall
	j tapos
abs:
	li t6, -1
	mul a1, t6, t5
	li a7, 56
	la a0, olympic_msg
	ecall
	j tapos
tapos: 
	ret0
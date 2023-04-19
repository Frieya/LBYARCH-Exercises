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

var1: .float Inf
var2: .float Inf

.text
main:




la t1, var1
la t2, var2
flw f1, (t1)
flw f2, (t2)
fadd.s f10, f1, f2
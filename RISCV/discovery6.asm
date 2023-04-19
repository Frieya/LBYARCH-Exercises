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
.macro print(%x)
	li a7, 34
	mv a0, %x
	ecall
	newline
.end_macro 

.data
BETA: .word 0xF1E1D1C1, 0xB1A19181

.text
main:
lui x10, 0xF0000

addi x11, x0, 0x05

mul x12, x10, x11

mulh x13, x10, x11
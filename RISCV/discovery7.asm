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
addi x10, x0, 0x64

xor x11, x12, x12

divu x12, x10, x11

remu x13, x10, x11
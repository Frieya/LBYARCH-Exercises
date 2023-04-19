.globl main

.data
	var1:.word 0xBBAA9988
	var2:.word 0x81ABCDEF
	var3:.word 0xCCDDEEFF
	var4:.word 0x000000FF
.text
main:
	la x5, var2
	lw x10, 0(x5)
	lw x11, 4(x5)
	lw x12, -4(x5)
	li a7, 34
	ecall
	mv a0, x11
	li a7, 34
	ecall
	mv a0, x12
	li a7, 34
	ecall
	li a7, 10
	ecall
 

	
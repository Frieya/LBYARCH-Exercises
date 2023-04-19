.globl main

.macro end
	li a7, 10
	ecall
.end_macro

.macro print_hex(%x)
	mv a0, %x
	li a7, 34
	ecall
.end_macro


.data
var1: .half -1

.text
main:
addi x5, x0, 0xFFFFFC18

mv a0, x5
li a7, 35

ecall
li a7, 34

ecall
li a7, 1

ecall

li a7, 36

ecall


		
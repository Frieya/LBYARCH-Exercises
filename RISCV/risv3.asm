.globl main

.macro end
	li a7, 10
	ecall
.end_macro

.macro print_int(%x)
	mv a0, %x
	li a7, 1
	ecall
.end_macro


.data
	msg1: .asciz "Hello World"
	msg2: .asciz "The answer is"
	num: .word 1,2,3
	sagot: .word 0
.text
main:
	addi x22, x0, 25
	la a0, msg2
	mv a1, x22
	li a7, 56 #print dialog box
	ecall
	#la a0, msg1
	#li a1, 1
	#li a7, 55
	#ecall
	#end
	li x22, 25
	print_int(x22)
	end

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
	la x5, num
	la x6, sagot
	addi x7, x0, 0
	lw x8 (x5) #x8=1
	add x7,x7,x8 #x7+=x8
	 #addi x5,x5,4 #add 4 bytes to pointer
	lw x8, 4(x5) #move pointer 4 bytes
	add x7,x7,x8 #x7+=x8
	lw x8, 8(x5)  #move pointer 8 bytes
	add x7, x7, x8  #x7+=x8
	sw x7, (x6)
	la a0, msg2
	mv a1, x7
	li a7, 56
	ecall
	end
	
	

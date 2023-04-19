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


.text
	main:
		#addi x11, x0, 0x7ff
		#addi x12, x0, 0xfffff8ff
		#add x10, x11, x12
		
		#addi x10, x0, 800
		
		#addi x10, x0, 0xFE
		
		#addi x11, x0, 0xFFFFFFFF
		#addi x10, x11, 0x00000002
		
		addi x10, x0, 0x7ff
		print_hex(x10)
		end
		
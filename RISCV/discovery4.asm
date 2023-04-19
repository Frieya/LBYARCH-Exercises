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


#.data
#var1: .byte 0xF1, 0xE1, 0xD1, 0xC1, 0xB1, 0xA1, 0x91, 0x81
#var2: .half 0xF1E1, 0xD1C1, 0xB1A1, 0x9181
#var3: .word 0xF1E1D1C1, 0xB1A19181

#.text
#	main:
		#la x5, var2
		#lw x6, 0(x5)
#		la x5, var3
#		lw x6, 0(x5)
#		print_hex(x6)
#		end

#.data
#var1: .word 0xF1E1D1C1
#
#var4: .word 0x12345678

#.text
#main:
#la x4, var4

#la x5, var1

#lw x6, 0(x5)

#sw x6, 0(x4)


#.data
#var1: .half 0xF1E1

#var4: .word 0x12345678

#.text
#main:
#la x4, var4

#la x5, var1

#lw x6, 0(x5)

#sw x6, 0(x4)

#.data
#var1: .byte 0xF1

#var4: .word 0x12345678

#.text
#main:
#la x4, var4

#la x5, var1

#lw x6, 0(x5)

#sw x6, 0(x4)

.data
var1: .half -1

.text
main:
la x5, var1
lw x6, 0(x5)
		
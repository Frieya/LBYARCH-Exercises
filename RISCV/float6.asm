.globl	main
.macro newline
	li a7, 11
	li a0, 10
	ecall
#John Wesley Abe S12
.end_macro 
.macro ret0
	li a7, 10
	ecall
.end_macro
.macro dialog_box_string(%x, %y)
	li a7, 59
	la a0, %x
	la a1, %y
	ecall
.end_macro 
.macro print_term(%x)
	li a7, 2
	fmv.s fa0, %x
	ecall
.end_macro 
.data
x: .float 0.785398
max_n: .word 6
function_msg1 .asciz "█░█ █▄█ █▀█ █▀▀ █▀█ █▄▄ █▀█ █░░ █ █▀▀\n█▀█ ░█░ █▀▀ ██▄ █▀▄ █▄█ █▄█ █▄▄ █ █▄▄ "

.text
main:
	li a7, 59
	la a0, function_msg1
	la a1, msg
	ecall
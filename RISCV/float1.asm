.globl	main

.macro ret0
	li a7, 10
	ecall
.end_macro	
.macro newline
	li a7, 11
	li a0, 10
	ecall
.end_macro 
.macro print_float(%x)
	fmv.s fa0, %x
	li a7, 2
	ecall 
.end_macro 
.macro print_string(%x)
	la a0, %x
	li a7, 4
	ecall 
.end_macro 
.data
	var1: .float 4.25
	var2: .float 5.5
	var3: .float 0.0
	var4: .float 1.0
	msg: .asciz "---- Breakpoint ----- \n"
.text
main:
	la t1, var1
	la t2, var2
	la t3, var3
	la t4, var4
	
	flw f1, (t1) #load 4.25
	flw f2, (t2) #load 5.5
	flw f3, (t4)
#add
	fadd.s f0, f1, f2 #operations reg-reg
	fsw f0, (t3) #store load again
	print_float(f1)
	newline
#sub

	fsub.s f0, f1, f2
	print_float(f0)
	newline
#mul
	fmul.s f0, f1, f2
	print_float(f0)
	newline
#div
	fdiv.s f0, f1, f2
	print_float(f0)
	newline
#sqrt
	fsqrt.s f0, f1
	print_float(f0)
	newline
#breakpoint
	print_string(msg)
#fmin
	fmin.s f0, f1, f2
	print_float(f0)
	newline
#fmax
	fmax.s f0, f1, f2
	print_float(f0)
	newline
#mul-add fmad.s f1,f2,f3,f4 f1<--(f2*f3)+f4
	fmadd.s f0,f1,f2,f3
	print_float(f0)
	newline
# breakpoint
	 print_string(msg)
#absolute value
	fabs.s f0, f1
	print_float(f0)
	newline
#negative 
	fneg.s f0, f1
	print_float(f0)
	newline

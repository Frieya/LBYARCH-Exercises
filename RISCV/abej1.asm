#John Wesley Abe S12

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

.data	
	str1: .space 100
	fname: .asciz "/Users/frieya_aegnar/Assembly/dna3.txt"
	msg1: .asciz "Length of the string is  "
	msg2: .asciz "No of Occurances of letter C: "
	msg3: .asciz "No of Occurances of letter G: "
	
.text
main: 
#open the file
	li a7, 1024 #open file 
	la a0, fname #file name
	li a1, 0 #0- read 1- write
	ecall
	mv s6, a0 # a0 file descriptor
	li a7, 1 # a0 -  file descriptor -1 means error
	ecall
	newline
#read the file
	li a7, 63 #read file
	mv a0, s6 #a0 file descrip
	la a1, str1 #a1 required where to place content
	li a2, 100 #size of the file
	ecall
	
#close file
	li a7, 57
	mv a0,s6
	ecall
#procsseing
#print string
	la a0, str1
	li a7, 4
	ecall
	newline
#count length
	la t1, str1
	addi t2, x0,10 #check line feed
	addi t3, x0, 13 # check form feed
	add t4, x0, x0 # check null
	addi t5, x0, 67 #hex value of C
	addi t6, x0, 71 #hex value of G

again:
	lb s2, (t1)
	beq s2, t2, tapos
	beq, s2, t3, tapos
	beq s2, t4, tapos
	addi s1, s1, 1 # accumulate
	addi t1, t1, 1#increment ptr
	beq, s2, t5, countC
	beq s2, t6, countG
	j again
countC:
	addi s10, s10, 1
	j again
countG:
	addi s11, s11, 1
	j again
tapos:
	mv a1, s1
	la a0, msg1
	li a7, 56
	ecall
	
	mv a1, s10
	la a0, msg2
	li a7, 56
	ecall
	
	mv a1, s11
	la a0, msg3
	li a7, 56
	ecall
	ret0

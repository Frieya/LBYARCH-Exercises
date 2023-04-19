%include "io.inc"
section .text
global main
main:
    mov ebp, esp; for correct debugging
    ;write your code here
 MOV AL, 0x80

MOV BL, 0xFF

ADD AL, BL
pushfw
pop ax
PRINT_HEX 4, AX
    ret
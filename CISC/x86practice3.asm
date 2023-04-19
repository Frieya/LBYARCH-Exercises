%include "io.inc"
section .data
var1 db 2,-3,4,-5,6,7,-1
sagot db 0
pos_num db 0
neg_num db 0
section .text
global main
main:
    ;write your code here
    xor cl, cl ; mov cl, 0
    xor dl, dl 
    lea esi, [var1] ; ESI --> vat1, ESI=address, Load Effective Address
AGAIN:
    mov al, [esi] ; [] dereferencing
    cmp al, -1 ;use constant 
    je TAPOS
    cmp al, 0
    jns  POSITIVE
    inc dl
    inc esi ; increment pointer by 1 (why 1 cos' db)
    jmp AGAIN
POSITIVE:
    inc cl
    inc esi
    jmp AGAIN
TAPOS:
    mov [pos_num], cl
    mov [neg_num], dl
    PRINT_DEC 1, [pos_num]
    NEWLINE
    PRINT_DEC 1, [neg_num]
    xor eax, eax
    ret
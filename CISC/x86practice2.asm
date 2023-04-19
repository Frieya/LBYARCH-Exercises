%include "io.inc"
section .data
var1 db 2,3,4,5,6,7,-1
sagot db 0 
section .text
global main
main:
    ;write your code here
    xor cl, cl ; mov cl, 0
    lea esi, [var1] ; ESI --> vat1, ESI=address, Load Effective Address
AGAIN:
    mov al, [esi] ; [] dereferencing
    cmp al, -1 ;use constant 
    je TAPOS
    add cl, al ; CL += AL
    inc esi ; increment pointer by 1 (why 1 cos' db)
    jmp AGAIN
TAPOS:
    mov [sagot], cl
    PRINT_DEC 1, [sagot]
    xor eax, eax
    ret
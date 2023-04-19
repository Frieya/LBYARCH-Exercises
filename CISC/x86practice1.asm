%include "io.inc"

section .data
var1 db 12 ; define byte ---> .byte
var2 db 24
var3 db 0
var11 db 0x1234  ;define word ---> .half
var12 db 0x5678
var99 db 0x0

section .text
global main
main:
    mov al, [var1] ; al= var1 register al = 1 byte
    mov bl, [var2] ;bl = var2
    add al, bl ; al = al+bl
    mov [var3], al ;var3 = al
    PRINT_DEC 1, [var3]
    ;write your code here
    PRINT_STRING "Hello World"
    NEWLINE
    mov ax, [var11]
    mov bx, [var12]
    add ax, bx
    mov [var99], ax
    PRINT_HEX 2, [var99]
    xor eax, eax
    ret
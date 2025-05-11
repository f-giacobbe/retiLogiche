%include "utils.nasm"

section .data
v dw 5, 8, 10, 13, 7, 3, -4, 3, -1, 12
nv equ ($-v)/2
w dd 2, -1, 3, 4, -2
nw equ ($-w)/4

section .bss
ris resb 1

section .text
extern proc
global _start
_start:
    push ris
    push v
    push w
    push dword nw
    call proc
    printb byte [ris]
    exit 0
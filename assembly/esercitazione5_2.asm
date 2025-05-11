;riceve un vettore di word v e restituisce il numero di elementi distinti presenti in v

%include "utils.nasm"

section .data
v dw -2, 3, 7, -2, 6, -10, 3, 6
n equ ($-v)/2

section .bss
ris resw 1

section .text
extern proc
global _start
_start:
    push v
    push dword n
    push ris
    call proc
    printw word [ris]
    exit 0
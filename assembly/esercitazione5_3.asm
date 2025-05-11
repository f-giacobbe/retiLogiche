;dato un vettore di word v, contare gli elementi che verificano una delle seguenti condizioni:
;1. v[i] >= 0 e v[i+2] < 0 e abs(v[i] - v[i+2]) > 4
;2. v[i] < 0 e v[i+1] >= 0 e abs(v[i] - v[i+1]) > 2

%include "utils.nasm"

section .data
v dw -1, 3, -2, -5, 10, -6, 2, -1
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
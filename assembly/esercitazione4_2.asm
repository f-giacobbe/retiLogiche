;Riceve un vettore V di word e restituisce il valore massimo tra la somma del valore assoluto degli 
;elementi di valore pari di V e la somma degli elementi di posizione dispari di V.

%include "utils.nasm"

section .data
v dw -2, 3, 7, 6, 2, -10, -3, 5
n equ ($-v)/2

section .bss
max resw 1

section .text
extern proc
global _start
_start:
    push max
    push v
    push dword n
    call proc
    printw word [max]
    exit 0
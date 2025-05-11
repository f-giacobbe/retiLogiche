;scrivere una funzione assembly che, dato un vettore V di word di lunghezza n e un intero k,
;conta il numero di coppie di elementi (V[i], V[(i+1)%n]), con 0<=i<=n-1 tali che la loro somma
;non è multipla di 2^k

%include "utils.nasm"

section .data
v dw 8, 4, 3, 7, 9, 12, 2, 8, 0
n equ (($-v)/2)-1
k db 3

section .text
extern proc
global _start
_start:
    sub esp, 4
    push v
    push dword n
    push k
    call proc
    pop eax
    printd eax
    exit 0
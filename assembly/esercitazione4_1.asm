;riceve un vettore di word A e un intero k. La procedura verifica se nell'array è presente una sequenza di 3
;elementi contigui di segno alternato la cui somma sia maggiore di k. In tal caso restituisco 1, altrimenti 0

%include "utils.nasm"

section .data
a dw -1, -3, 2, -1, 8, 3, -2, 9
n equ ($-a)/2
k dw 5

section .bss
ris resb 1

section .text
extern proc
global _start
_start:
    push ris
    push a
    push n
    push word [k]
    call proc
    printb byte [ris]
    exit 0
;Scrivere una funzione assembly che, dato un vettore di word V, stampa l'indirizzo dell'elemento in cui
;ha inizio la prima sequenza di tre valori uguali consecutivi. Se non esiste stampa -1.

%include "utils.nasm"

section .data
v dw 4, 0, 9, 1, 1, 1
n equ ($-v)/2

section .text
extern proc
global _start
_start:
    push v
    push n
    call proc
    mov eax, v+6
    printd eax
    exit 0
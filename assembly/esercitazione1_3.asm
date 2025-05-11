;dato un vettore v di dimensione n, per ogni posizione i di v si definisce la posizione
;complementare i' pari a n-1-i. Scrivere una funzione che conta il numero di coppie
;(v[i], v[i']) con i <= i' tali che il prodotto v[i]*v[i'] è multiplo di 4

%include "utils.nasm"

section .data
v dw -2, 3, 8, 2, 1, -6, 2
n equ ($-v)/2

section .text
global _start
_start:
    xor esi, esi    ;i=0
    mov edi, n-1    ;i'=n-1
    xor edx, edx    ;cnt=0

ciclo:
    cmp esi, edi
    jg fine
    mov ax, [v+esi*2]
    imul ax, [v+edi*2]
    and ax, 11b
    jnz else    ;non multiplo
    inc edx

else:
    inc esi
    dec edi
    jmp ciclo

fine:
    printd edx
    exit 0
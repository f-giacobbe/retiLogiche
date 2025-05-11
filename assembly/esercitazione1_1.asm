;dato un vettore v, scrivere un programma che effettui la somma di tutti i valori della
;prima metà del vettore con i rispettivi valori corrispondenti nella seconda metà.
;La dimensione del vettore è pari.
;   w[i] = v[i] + v[n-1-i]

%include "utils.nasm"

section .data
v dw 1, 2, 3, 4
n equ ($-v)/2

section .bss
w resw n/2

section .text
global _start
_start:
    xor edi, edi    ;i=0
    mov esi, n-1    ;j=n-1

ciclo:
    cmp edi, n/2
    jge .stampa
    mov ax, [v+edi*2]
    add ax, [v+esi*2]
    mov [w+edi*2], ax
    inc edi
    dec esi
    jmp ciclo

.stampa:
    xor esi, esi

ciclostampa:
    cmp esi, n/2
    jge .fine
    printw word [w+esi*2]
    inc esi
    jmp ciclostampa

.fine:
    exit 0
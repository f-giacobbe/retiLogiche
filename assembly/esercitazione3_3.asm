;riceve un vettore di word A e un vettore di word B e restituisce un intero.
;Il vettore A viene utilizzato per accedere ad elementi distinti del vettore B.
;L'istruzione verificherà se la sequenza degli elementi del vettore B le cui posizioni sono presenti in A
;è ordinata in senso crescente. In questo caso l'istruzione restituisce 1, altrimenti 0

%include "utils.nasm"

section .data
a dw 2, 3, 1
na equ ($-a)/2
b dw 3, 4, -1, 2
nb equ ($-b)/2

section .bss
ris resb 1

section .text
extern proc
global _start
_start:
    push a
    push dword na
    push b
    push dword nb
    push ris
    call proc
    printb byte [ris]
    exit 0
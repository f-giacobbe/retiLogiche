;Scrivere una procedura assembly che riceve in input un vettore di word V avente lunghezza n pari.
;La procedura calcola il massimo tra i seguenti valori : abs(v[i]-v[n-i-1]) e restituisce l'indice i
;corrispondente alla coppia di elementi che ha prodotto il massimo valore trovato

%include "utils.nasm"

section .data
v dw 1, -2, -6, 3, -2, 4
n equ ($-v)/2

section .text
extern proc
global _start
_start:
    sub esp, 4
    push v
    push dword n
    call proc
    pop eax
    printd eax
    exit 0
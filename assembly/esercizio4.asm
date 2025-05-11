;Riceve un vettore di word V e un vettore di double word W, entrambi di dimensione n.
;Il vettore W contiene degli indirizzi, in ciascuno dei quali è memorizzato un intero a 16 bit
;La procedura considera i prodotti v[i] * M[w[i]] con i[0, n-1] e restituisce il massimo
;tra essi

%include "utils.nasm"

section .data
v dw 1, 2, 3, 4, 5
n equ ($-v)/2
w dd 1231239, 123148, 120918, 019280129, 12948139420

section .bss
ris resw 1

section .text
extern proc
global _start
_start:
    push ris
    push v
    push dword n
    push w
    call proc
    printw word [ris]
    exit 0
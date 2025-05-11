;riceve due vettori v e w della stessa dimensione n e restituisce un vettore t che contiene:
;la somma degli elementi di indici pari di v e w
;la copia degli elementi di indice dispari in due celle contigue

%include "utils.nasm"

section .data
v dw 12, 2, 4, 3, 8
w dw 3, 7, 5, 1, 4
n equ ($-w)/2
n_t equ (n/2)*3 + (n % 2)

section .bss
t resw n_t ;15, 2, 7, 9, 3, 1, 12

section .text
extern proc
global _start
_start:
    push dword n_t
    push t
    push dword n
    push w
    push v
    call proc
    xor esi, esi

ciclo:
    cmp esi, n_t
    jge fine
    printw word [t + esi*2]
    inc esi
    jmp ciclo

fine:
    exit 0
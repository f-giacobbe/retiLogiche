;riceve un vettore di word V di dimensione n e restituisce un vettore di word W. Il vettore V contiene i
;numeri compresi tra 0 e n-1 disposti in ordine non noto. Il vettore W restituito dalla procedura ha 
;dimensione n e il generico elemento W[i] contiene la posizione che il numero i assume nel vettore V

%include "utils.nasm"

section .data
v dw 7, 1, 0, 2, 8, 6, 9, 3, 5, 4
n equ ($-v)/2

section .bss
w resw n

section .text
extern proc
global _start
_start:
    push w
    push n
    push v
    call proc
    xor esi, esi

ciclo:
    cmp esi, n
    jge fine

    printw word [w + esi*2]
    inc esi
    jmp ciclo

fine:
    exit 0
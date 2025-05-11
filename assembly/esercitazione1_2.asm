;scrivere una funzione Assembly che, dato un vettore V di word di dimensione n, conta il numero
;di terne di elementi per le quali vale una delle seguenti proprietà:
;
;   -v[i] è pari e v[i] < v[i+1] + v[i+2]
;
;   -v[i] è dispari e v[i] > v[i+1] - v[i+2]
;

%include "utils.nasm"

section .data
v dw 3, 4, -2, 8, 1, 5, 6
n equ ($-v)/2

section .text
global _start:
_start:
    xor esi, esi    ;i=0
    xor edi, edi    ;cnt=0

ciclo:
    cmp esi, n-2
    jge fine
    mov ax, [v+esi*2]
    mov bx, [v+(esi+1)*2]
    ror ax, 1   ;mette il bit di parità all'inizio
    jnc pari    ;if (!(CF == 1))
    sub bx, [v+(esi+2)*2]
    rol ax, 1
    cmp ax, bx
    jle avanti

incr:
    inc edi

avanti:
    inc esi
    jmp ciclo

pari:
    add bx, [v+(esi+2)*2]
    rol ax, 1
    cmp ax, bx
    jge avanti
    jmp incr

fine:
    printd edi
    exit 0
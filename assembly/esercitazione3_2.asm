;riceve due vettori V e W, entrambi di word. Siano nv e nw rispettivamente le lunghezze dei due vettori,
;con nv>nw. La procedura opera su V le seguenti sostituzioni: V[i] = V[i] + W[i%nw],
;i appartenente [0, nv-1]

%include "utils.nasm"

section .data
v dw 1, 19, 19, 3, 13, 2, 12, 25
nv equ ($-v)/2
w dw 18, 12, 3
nw equ ($-w)/2

section .text
extern proc
global _start
_start:
    push v
    push dword nv
    push w
    push dword nw
    call proc

    xor esi, esi

ciclo:
    cmp esi, nv
    jge fine
    printw word [v+esi*2]
    inc esi
    jmp ciclo

fine:
    exit 0
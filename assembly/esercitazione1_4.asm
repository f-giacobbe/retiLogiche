;scrivere un programma che verifica che la codifica binaria di un numero n ha esattamente
;k bit pari a 1

%include "utils.nasm"

section .data
x dw 5
k dw 2
msg1 db "il numero x contiene k bit pari a 1 ", 0

section .text
global _start
_start:
    xor cl, cl
    mov ax, [x]

ciclo:
    cmp ax, 0
    je fine
    shr ax, 1
    jnc ciclo
    inc cl
    jmp ciclo

fine:
    cmp cl, [k]
    jne fine1
    prints msg1, 37

fine1:
    exit 0
;dato un vettore v, scrivere un programma che conti il numero di elementi la cui codifica
;binaria ha esattamente k bit pari a 1

%include "utils.nasm"

section .data
v dd 1, 2, 3, 4, 5
n equ ($-v)/4
k dd 1

section .text
global _start
_start:
    xor esi, esi    ;i=0
    xor edi, edi    ;res=0

for:
    cmp esi, n
    jge fine
    xor edx, edx    ;cnt=0

while:
    cmp dword [v+esi*4], 0
    je finewhile
    shr dword [v+esi*4], 1
    jnc while
    inc edx
    jmp while

finewhile:
    cmp edx, dword [k]
    jne incremento
    inc edi

incremento:
    inc esi
    jmp for

fine:
    printd edi
    exit 0
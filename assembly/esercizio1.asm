;int espr(int x) {
;   return x*x + x + 1;
;}
;
;void proc(int[] x, int[] y, int n) {
;   for (int i=0; i<n; i++)
;       y[i] = espr(x[i]);
;}

%include "utils.nasm"

section .data
x dd 1, 2, 3, 4, 5
n equ ($-x)/4

section .bss
y resd 5

section .text
global _start
_start:
    push x
    push y
    push n
    call proc

    printd dword [y]
    printd dword [y + 4]
    printd dword [y + 8]
    printd dword [y + 12]
    printd dword [y + 16]
    exit 0

proc:
    push ebp
    mov ebp, esp
    pushad
    xor esi, esi
    mov edi, [ebp + 8]

.ciclo:
    cmp esi, edi
    jge .fineciclo
    mov ecx, [ebp + 16] ;indirizzo array x
    mov edx, [ebp + 12] ; indirizzo array y
    mov eax, [ecx + esi*4]
    sub esp, 4  ;risultato espr
    push eax
    call espr
    pop eax ;risultato espr
    mov [edx + esi*4], eax
    inc esi
    jmp .ciclo

.fineciclo:
    popad
    mov esp, ebp
    pop ebp
    ret 12

espr:
    push ebp
    mov ebp, esp
    pushad
    mov eax, [ebp + 8]
    mul eax
    add eax, [ebp + 8]
    inc eax
    mov [ebp + 12], eax
    popad
    mov esp, ebp
    pop ebp
    ret 4

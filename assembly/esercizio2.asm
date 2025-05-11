;int fatt(int n) {
;   if (n == 0)
;       return 1;
;   else
;       return n * fatt(n-1);

%include "utils.nasm"

section .data
n dd 5

section .text
global _start
_start:
    sub esp, 4
    push dword [n]
    call fatt
    pop eax
    printd eax
    exit 0

fatt:
    push ebp
    mov ebp, esp
    pushad
    mov eax, [ebp + 8]
    cmp eax, 0

    jne .else
    mov [ebp + 12], dword 1
    popad
    mov esp, ebp
    pop ebp
    ret 4

.else:
    mov ebx, eax
    dec ebx
    sub esp, 4
    push ebx
    call fatt
    pop ebx
    imul eax, ebx
    mov [ebp + 12], eax
    popad
    mov esp, ebp
    pop ebp
    ret 4
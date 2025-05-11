section .data
ris equ 20
v equ 16
w equ 12
nw equ 8

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad

    mov eax, [ebp + v]
    mov ebx, [ebp + w]
    mov edi, [ebp + nw]

    mov esi, [ebx]
    add ebx, 4
    dec edi
    mov cx, [eax + esi*2]

ciclo:
    cmp edi, 0
    jle true

    add esi, [ebx]
    add ebx, 4
    mov dx, [eax + esi*2]

    cmp cx, dx
    jg prox
    mov eax, [ebp + ris]
    mov [eax], byte 0
    popad
    mov esp, ebp
    pop ebp
    ret 16

prox:
    mov cx, dx
    dec edi
    jmp ciclo

true:
    mov eax, [ebp + ris]
    mov [eax], byte 1
    popad
    mov esp, ebp
    pop ebp
    ret 16
section .data
n_t equ 24
t equ 20
n equ 16
w equ 12
v equ 8

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad

    mov ebx, [ebp + t]
    mov edi, [ebp + n]

    xor esi, esi
    xor edx, edx
    xor ecx, ecx

ciclo:
    cmp esi, edi
    jge fine

    ror esi, 1
    jc dispari

pari:
    rol esi, 1
    mov eax, [ebp + v]
    mov cx, [eax + esi*2]
    mov eax, [ebp + w]
    add cx, [eax + esi*2]
    mov [ebx + edx*2], cx
    inc edx
    jmp incremento

dispari:
    rol esi, 1
    mov eax, [ebp + v]
    mov cx, [eax + esi*2]
    mov [ebx + edx*2], cx
    mov eax, [ebp + w]
    mov cx, [eax + esi*2]
    mov [ebx + (edx+1)*2], cx
    add edx, 2

incremento:
    inc esi
    jmp ciclo

fine:
    popad
    mov esp, ebp
    pop ebp
    ret 20
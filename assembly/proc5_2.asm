section .data
v equ 16
n equ 12
ris equ 8

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad

    mov eax, [ebp + v]
    mov edx, [ebp + n]
    xor cx, cx ;cnt
    xor esi, esi ;i

ciclo:
    cmp esi, edx
    jge fine

    mov bx, [eax + esi*2]

    xor edi, edi

ciclo2:
    cmp edi, esi
    jge distinti

    cmp bx, [eax + edi*2]
    je avanti
    inc edi
    jmp ciclo2

distinti:
    inc cx

avanti:
    inc esi
    jmp ciclo

fine:
    mov edx, [ebp + ris]
    mov [edx], cx

    popad
    mov esp, ebp
    pop ebp
    ret 12
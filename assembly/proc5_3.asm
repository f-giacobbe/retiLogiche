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
    mov edi, [ebp + n]
    sub edi, 2
    xor esi, esi
    xor bx, bx

ciclo:
    cmp esi, edi
    jge ultimi

    mov cx, [eax + esi*2]
    cmp cx, 0
    jl cond2
    mov dx, [eax + (esi+2)*2]
    cmp dx, 0
    jge avanti
    sub cx, dx
    cmp cx, 4
    jle avanti

update:
    inc bx
    jmp avanti

cond2:
    mov dx, [eax + (esi+1)*2]
    cmp dx, 0
    jl avanti
    sub cx, dx
    neg cx
    cmp cx, 2
    jg update

avanti:
    inc esi
    jmp ciclo

ultimi:
    mov cx, [eax + esi*2]
    cmp cx, 0
    jge fine
    mov dx, [eax + (esi+1)*2]
    cmp dx, 0
    jl fine
    sub cx, dx
    neg cx
    cmp cx, 2
    jle fine
    inc bx

fine:
    mov edx, [ebp + ris]
    mov [edx], bx

    popad
    mov esp, ebp
    pop ebp
    ret 12
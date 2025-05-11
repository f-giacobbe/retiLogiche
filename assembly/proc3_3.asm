section .data
a equ 24
na equ 20
b equ 16
nb equ 12
ris equ 8

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad

    xor ecx, ecx
    xor edx, edx

    mov eax, [ebp + a] ;eax punta ad a
    mov ebx, [ebp + b] ;ebx punta a b

    movzx esi, word [eax] ;esi = a[0]
    add eax, 2
    mov dx, [ebx + esi*2] ; dx = b[a[0]]

    mov edi, [ebp + na] ; edi = len(a)
    dec edi ; edi = len(a)-1

ciclo:
    cmp edi, 0
    jle fine

    movzx esi, word [eax] ;esi = a[i]
    add eax, 2
    mov cx, [ebx + esi*2] ;cx = b[a[i]]

    cmp cx, dx
    jge else
    mov eax, [ebp + ris]
    mov [eax], byte 0
    popad
    mov esp, ebp
    pop ebp
    ret 20

else:
    mov dx, cx
    dec edi
    jmp ciclo

fine:
    mov eax, [ebp + ris]
    mov [eax], byte 1
    popad
    mov esp, ebp
    pop ebp
    ret 20
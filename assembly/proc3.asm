section .data
res equ 16
v equ 12
n equ 8

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad

    mov eax, [ebp + v] ;eax punta a v [i]
    xor esi, esi ;i=0
    mov edi, [ebp + n] ;edi = n
    dec edi ;edi = n-1
    shl edi, 1 ;edi =(n-1)*2
    mov ebx, eax ;ebx punta a v
    add ebx, edi ;ebx punta a v[j] (n-1)

    xor edx, edx ;max_diff
    xor edi, edi ;max_i
    
ciclo:
    cmp eax, ebx
    jge fine

    mov cx, [eax]
    add eax, 2
    sub cx, [ebx]
    sub ebx, 2

    cmp cx, 0
    jge positivo
    neg cx

positivo:
    cmp cx, dx
    jl else
    mov edi, esi
    mov dx, cx

else:
    inc esi
    jmp ciclo

fine:
    mov [ebp + res], edi

    popad
    mov esp, ebp
    pop ebp
    ret 8
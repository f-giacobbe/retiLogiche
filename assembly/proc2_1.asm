section .data
v equ 24
w equ 20
q equ 16
r equ 12
n equ 8

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad
    xor esi, esi ;i=0

.ciclo:
    cmp esi, [ebp + n] 
    jge .fine

    xor eax, eax
    xor ecx, ecx

    mov ebx, [ebp + v] ; ebx = indirizzo di v
    mov edx, [ebx + esi*4] ;edx = v[i] (indirizzo)
    mov cx, [edx] ; cx = m[v[i]]

    xor edx, edx
    
    mov ebx, [ebp + w] ;ebx = indirizzo di w
    mov ax, [ebx + esi*2] ;ax = w[i]

    idiv cx

    mov ebx, [ebp + q] ;ebx = indirizzo di q
    mov [ebx + esi*2], ax
    mov ebx, [ebp + r] ;ebx = indirizzo di r
    mov [ebx + esi*2], dx
    inc esi
    jmp .ciclo

.fine:
    popad
    mov esp, ebp
    pop ebp
    ret 20

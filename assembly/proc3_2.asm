section .data
v equ 20
nv equ 16
w equ 12
nw equ 8

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad

    xor ecx, ecx

    mov eax, [ebp + v] ;eax = indirizzo v
    mov ebx, [ebp + w] ;ebx = indirizzo w
    mov esi, [ebp + nv] ;esi = lunghezza v
    mov edi, [ebp + nw] ;edi = lunghezza w

    xor edx, edx ;contatore i%nw

ciclo:
    cmp esi, 0
    je fine

    mov cx, [ebx + edx*2]
    add [eax], cx

    inc edx
    cmp edx, edi
    jne decremento
    xor edx, edx

decremento:
    add eax, 2
    dec esi
    jmp ciclo

fine:
    popad
    mov esp, ebp
    pop ebp
    ret 16
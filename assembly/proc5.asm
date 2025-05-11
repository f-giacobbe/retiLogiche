section .data
ris equ 24
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

    mov eax, [ebp + v]
    mov ebx, [ebp + w]
    mov esi, [ebp + nw]
    xor edi, edi

inizializzo:
    mov ecx, [ebx + edi*4] ;w[0]
    mov dx, [eax + ecx*2] ;v[w[0]]
    inc edi

ciclo:
    cmp edi, esi
    jge uno

    add ecx, [ebx + edi*4]
    cmp [eax + ecx*2], dx
    jg zero
    
    mov dx, [eax + ecx*2]
    inc edi
    jmp ciclo

zero:
    xor eax, eax
    jmp fine

uno:
    xor eax, eax
    mov al, byte 1

fine:
    mov ebx, [ebp + ris]
    mov [ebx], al

    popad
    mov esp, ebp
    pop ebp
    ret 20
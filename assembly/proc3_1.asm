%include "utils.nasm"

section .data
v equ 12
n equ 8

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad

    mov edi, [ebp + n]
    cmp [ebp + n], dword 3
    jl fine

    sub edi, 2
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    mov eax, [ebp + v] ;eax = indirizzo v[0]
    xor esi, esi

ciclo:
    cmp esi, edi
    jge fine

    mov bx, [eax + esi*2] ;bx=v[i]
    mov cx, [eax + (esi+1)*2];cx=v[i+1]
    mov dx, [eax + (esi+2)*2];dx=v[i+2]

    cmp bx, cx
    jne else
    cmp cx, dx
    jne else

    ;ho trovato sequenza di tre elementi uguali -> stampo l'indirizzo di i e termino procedura
    lea ebx, [eax + esi*2]
    printd ebx
    popad
    mov esp, ebp
    pop ebp
    ret 8

else:
    inc esi
    jmp ciclo

fine: ;non ho trovato nessuna sequenza
    printd dword -1
    popad
    mov esp, ebp
    pop ebp
    ret 8
;riceve un vettore di word A e un intero k. La procedura verifica se nell'array è presente una sequenza di 3
;elementi contigui di segno alternato la cui somma sia maggiore di k. In tal caso restituisco 1, altrimenti 0

section .data
ris equ 18
a equ 14
n equ 10
k equ 8

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad

    mov edi, [ebp + a] ;edi = ind. a
    mov esi, [ebp + n] ;esi = n
    mov al, 0 ;al = 0

ciclo:
    cmp esi, 2
    jle fine

    mov bx, [edi]
    mov cx, [edi + 2]
    xor bx, cx
    jns avanti
    mov dx, [edi + 4]
    xor cx, dx
    js verificak
    dec esi
    add edi, 2

avanti:
    dec esi
    add edi, 2
    jmp ciclo

verificak:
    mov bx, [edi]
    add bx, [edi + 2]
    add bx, dx
    cmp bx, [ebp + k]
    jle avanti
    mov al, 1
    jmp fine

fine:
    mov edx, [ebp + ris]
    mov [edx], al

    popad
    mov esp, ebp
    pop ebp
    ret 14
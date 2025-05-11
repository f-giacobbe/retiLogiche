;scrivere una funzione assembly che, dato un vettore V di word di lunghezza n e un intero k,
;conta il numero di coppie di elementi (V[i], V[(i+1)%n]), con 0<=i<=n-1 tali che la loro somma
;non è multipla di 2^k

%include "utils.nasm"
section .data
res equ 20 ;double
v equ 16 ;indirizzo vettore v di word
n equ 12 ;n (double)
k equ 8 ;indirizzo k (byte)

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad

    xor esi, esi
    xor edi, edi ;contatore

    xor ecx, ecx
    xor edx, edx

    mov eax, [ebp + v] ; eax = indirizzo di v

    mov dx, 1
    mov ebx, [ebp + k]
    mov cl, [ebx]
    shl dx, cl
    dec dx

    xor ebx, ebx

.ciclo:
    cmp esi, [ebp + n]
    jge .ultimo

    mov bx, [eax + esi*2]
    add bx, [eax + (esi+1)*2]

    and bx, dx
    jz .multiplo
    inc edi

.multiplo:
    inc esi
    jmp .ciclo

.ultimo:
    mov bx, [eax + esi*2]
    add bx, [eax]
    and bx, dx
    jz .fine
    inc edi

.fine:
    mov [ebp + res], edi
    popad
    mov esp, ebp
    pop ebp
    ret 12
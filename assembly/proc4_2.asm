;Riceve un vettore V di word e restituisce il valore massimo tra la somma del valore assoluto degli 
;elementi di valore pari di V e la somma degli elementi di posizione dispari di V.

section .data
max equ 16
v equ 12
n equ 8

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad

    mov eax, [ebp + v] ;eax = ind. v
    mov esi, [ebp + n]
    xor bx, bx
    xor cx, cx
    xor edi, edi

ciclo:
    cmp edi, esi
    jge fine

    mov dx, [eax + edi*2]
    ror edi, 1
    jnc pospari
    add cx, dx

pospari:
    rol edi, 1
    ror dx, 1
    jc avanti
    rol dx, 1
    cmp dx, 0
    jge aggiungi
    neg dx

aggiungi:
    add bx, dx

avanti:
    inc edi
    jmp ciclo

fine:
    cmp bx, cx
    jge scrivimax
    mov bx, cx

scrivimax:
    mov eax, [ebp + max]
    mov [eax], bx

    popad
    mov esp, ebp
    pop ebp
    ret 12
;Riceve un vettore di word V e un vettore di double word W, entrambi di dimensione n.
;Il vettore W contiene degli indirizzi, in ciascuno dei quali è memorizzato un intero a 16 bit
;La procedura considera i prodotti v[i] * M[w[i]] con i[0, n-1] e restituisce il massimo
;tra essi

section .data
ris equ 20
v equ 16
n equ 12
w equ 8

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad

    mov eax, [ebp + v] ;eax = ind.v
    mov ebx, [ebp + w] ;ebx = ind.w
    mov esi, [ebp + n] ;esi = n
    
    ;inizializzazione massimo
    mov cx, [eax] ;cx=v[0]
    mov edx, [ebx] ;edx=w[0]
    imul cx, [edx]

    mov edx, [ebp + ris]
    mov [edx], cx

    add eax, 2
    add ebx, 4
    dec esi

ciclo:
    cmp esi, 0
    jle fine

    mov cx, [eax]
    mov edx, [ebx]
    imul cx, [edx]

    mov edx, [ebp + ris]
    cmp cx, [edx]
    jle avanti
    mov [edx], cx
    add eax, 2
    add ebx, 4
    dec esi
    jmp ciclo

avanti:
    add eax, 2
    add ebx, 4
    dec esi
    jmp ciclo

fine:
    popad
    mov esp, ebp
    pop ebp
    ret 16
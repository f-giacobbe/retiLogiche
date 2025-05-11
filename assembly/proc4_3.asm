;riceve un vettore di word V di dimensione n e restituisce un vettore di word W. Il vettore V contiene i
;numeri compresi tra 0 e n-1 disposti in ordine non noto. Il vettore W restituito dalla procedura ha 
;dimensione n e il generico elemento W[i] contiene la posizione che il numero i assume nel vettore V

section .data
w equ 16
n equ 12
v equ 8

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad

    mov eax, [ebp + v]
    mov ebx, [ebp + w]
    xor esi, esi
    mov edi, [ebp + n]

ciclo:
    cmp esi, edi
    jge fine

    mov cx, [eax + esi*2]
    movzx ecx, cx
    mov [ebx + ecx*2], si
    
    inc esi
    jmp ciclo

fine:
    popad
    mov esp, ebp
    pop ebp
    ret 12
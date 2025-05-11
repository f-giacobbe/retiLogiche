;Scrivere una funzione assembly che, dato un vettore di double word V e un vettore di word W entrambi
;della stessa lunghezza n, costruisce due nuovi vettori di word Q e R come descritto di seguito.
;Il vettore V contiene indirizzi di memoria, in ciascuno dei quali è memorizzato un intero a 16 bit;
;W contiene degli interi (a 16 bit). La funzione memorizza in ogni elemento Q[i] il risultato della divisione
;tra l'intero W[i] e l'intero memorizzato all'indirizzo contenuto in V[i], e in R[i] il resto di tale
;divisione
;Q[i] = W[i]/M[V[i]]
;R[i] = W[i]%M[V[i]]

%include "utils.nasm"

section .data
n0 dw 1
n1 dw 2
n2 dw 3
n3 dw 4
v dd n0, n1, n2, n3
w dw 5, 6, 7, 8
n equ ($-w)/2

section .bss
q resw n
r resw n

section .text
extern proc
global _start
_start:
    push v 
    push w 
    push q 
    push r 
    push n 
    call proc
    printw word [q]
    printw word [q+2]
    printw word [q+4]
    printw word [q+6]
    printw word [r]
    printw word [r+2]
    printw word [r+4]
    printw word [r+6]
    exit 0
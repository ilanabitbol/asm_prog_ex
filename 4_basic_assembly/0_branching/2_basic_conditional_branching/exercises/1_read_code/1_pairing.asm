; Basic Assembly
; ==============
;
; Basic Conditional Branching
; ---------------------------
;
; Read Code
; ---------
;
; Pairing
; @@@@@@@
;
; 0.    Assemble and run this program.
;
; 1.    How many inputs does this program expect?
;       On peut voir 4 call à la fonction read_hex
; 2.    Try to give different inputs to this program, and check the results.
;
; 3.    Read the program's code below, and try to understand it.
;       Try to describe it as simply as you can.
;       si a+d=b+c => alors on affiche 1 sinon 0
;       Note that the relevant part of the code is from the "start" label until
;       the [ExitProcess] call invocation. You do not need to read the input and
;       output subroutines.
;
; 4.    Pick some random inputs and verify your predictions about what this
;       program does.

format PE console
entry start

include 'win32a.inc'

; ===============================================
section '.text' code readable executable

start:
    ; The program begins here:

    call    read_hex;eax=a ecx=0 edx=0 esi=0
    mov     ecx,eax;eax=a ecx=a edx=0 esi=0
    call    read_hex;eax=b ecx=a edx=0 esi=0
    mov     edx,eax;eax=b ecx=a edx=b esi=0
    call    read_hex;eax=c ecx=a edx=b esi=0
    mov     esi,eax;eax=c ecx=a edx=b esi=c
    call    read_hex;eax=d ecx=a edx=b esi=c
    add     eax,ecx;eax=d+a ecx=a edx=b esi=c
    add     edx,esi;eax=d+a ecx=a edx=b+c esi=c
    sub     eax,edx;eax=d+a-(b+c)=d+a-b-c ecx=a edx=b+c esi=c

    jnz     g1;si a-b+d-c!=0 => output:"0" sinon a+d=b+c =>output:"1"

    mov     eax,1
    call    print_eax
    jmp     g2

g1:
    mov     eax,0
    call    print_eax
g2:

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

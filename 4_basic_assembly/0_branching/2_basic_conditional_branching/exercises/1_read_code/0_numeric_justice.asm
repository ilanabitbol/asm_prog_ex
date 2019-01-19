; Basic Assembly
; ==============
;
; Basic Conditional Branching
; ---------------------------
;
; Read Code
; ---------
;
; Numeric Justice
; @@@@@@@@@@@@@@@
;
; 0.    Assemble and run this program.
;
; 1.    How many inputs does this program expect?
;       On peut voir deux call à la fonction read_hex
; 2.    Try to give different inputs to this program, and check the results.
;
; 3.    Read the program's code below, and try to understand it.
;       Try to describe it as simply as you can.
;       Ce programme affiche 0 si le resultat de b-a!=0 sinon il affiche 1 => b-a=0 <=>b=a
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

    call    read_hex;ecx=0 eax=a
    mov     ecx,eax;ecx=a eax=a
    call    read_hex;ecx=a eax=b
    sub     eax,ecx;ecx=a eax=b-a
    jnz     l1;si b-a!=0 jump vers l1

    mov     eax,1;ecx=a eax=1
    call    print_eax;output:"1"
    jmp     l2;fin du programme

l1:
    mov     eax,0;ecx=a eax=0
    call    print_eax;output:"0"
l2:

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

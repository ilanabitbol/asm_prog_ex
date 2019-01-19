; Basic Assembly
; ==============
;
; Basic Conditional Branching
; ---------------------------
;
; Read Code
; ---------
;
; Great Powers
; @@@@@@@@@@@@
;
; 0.    Assemble and run this program.
;
; 1.    How many inputs does this program expect?
;       On peut voir 1 call à la fonction read_hex
; 2.    Try to give different inputs to this program, and check the results.
;
; 3.    Read the program's code below, and try to understand it.
;       Try to describe it as simply as you can.
;
;       Ce programme calcul la valeur de 2 puissance a
;
;       Note that the relevant part of the code is from the "start" label until
;       the [ExitProcess] call invocation. You do not need to read the input and
;       output subroutines.
;
; 4.    Pick some random inputs and verify your predictions about what this
;       program does.
; 5.    Given the input of 0, what is the output of this program?
;       Why does it take so long for the program to compute it?
;
;       Is it the right output? Non, 2^0=1 et pas 0
;       If not, fix the program to give back the right output.

format PE console
entry start

include 'win32a.inc'

; ===============================================
section '.text' code readable executable

start:
    ; The program begins here:

    call    read_hex;eax=a ecx=0
    cmp     eax,0
    je      label0
    mov     ecx,1;eax=a ecx=1(initialisation du compteur)

lb1:
    add     ecx,ecx;eax=a ecx=ecx+ecx=1+1(2):2+2(4):4+4(8):8+8(16):16+16(32):...:2^a
    dec     eax;eax=eax-1
    jnz     lb1;tant que eax!=0 => on loop sur les deux instructions du dessus

    mov     eax,ecx;sinon eax=ecx
    call    print_eax

    ; Exit the process:
	push	0
	call	[ExitProcess]
label0:
    mov     eax,1
    call    print_eax
    ;Exit the process:
    push	0
    call	[ExitProcess]

include 'training.inc'

; Basic fasm
; ==========
;
; Read Code
; ---------
;
; Strange Calc
; @@@@@@@@@@@@
;
; 0.    Assemble and run this program.
;       cmd -> fasm 0_strange_calc.asm
; 1.    How many inputs does this program expect?
;       read_hex est une fonction qui lit un nombre et elle est appelée deux fois
; 2.    Try to give different inputs to this program, and check the results.
;
; 3.    Read the program's code below, and try to understand what does it do. Try
;       to describe it as simply as you can.
;
;       Note that the relevant part of the code is from the "start" label until
;       the [ExitProcess] call invocation. You do not need to read the input and
;       output subroutines.
;       Il apparait que le programme calcul le resultat du (a+b)*2+inc <=>
; 4.    Pick some random inputs and verify your predictions about what this
;       program does.

format PE console
entry start

include 'win32a.inc'

; ===============================================
section '.text' code readable executable

start:
    ; The program begins here:

    call    read_hex;edx=0x0 et eax=a
    mov     edx,eax;edx=a et eax=a
    call    read_hex;edx=a et eax=b
    add     eax,edx;eax=a+b et edx=a
    add     eax,eax;eax=2*(a+b) et edx=a
    inc     eax;eax=2*(a+b)+1 et edx=a

    call    print_eax

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

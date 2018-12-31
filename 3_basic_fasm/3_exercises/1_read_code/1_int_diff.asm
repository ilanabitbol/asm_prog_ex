; Basic fasm
; ==========
;
; Read Code
; ---------
;
; Int Diff
; @@@@@@@@
;
; 0.    Assemble and run this program.
;
; 1.    How many inputs does this program expect?
;       read_hex est appelé deux fois
; 2.    Try to give different inputs to this program, and check the results.
;
; 3.    Read the program's code below, and try to understand what does it do. Try
;       to describe it as simply as you can.
;
;       Note that the relevant part of the code is from the "start" label until
;       the [ExitProcess] call invocation. You do not need to read the input and
;       output subroutines.
;       ce programme calcul la difference des deux inputs au carré
; 4.    Pick some random inputs and verify your predictions about what this
;       program does.
;
; 5.    Use the following input values: 0xffffffff and 0x1. Explain the output
;       that you get back from the program.
;       0xffffffff*0xffffffff=0x[fffffffe 00000001]
;       0x1*0x1=0x00000001
;       0x[fffffffe 00000001] - 0x00000001 = 0xfffffffe 00000000
;       Alors esi=0x00000000 car sa taille est de 32 bits et non 64 bits c'est pour cela que l'on ne voit pas le reste du resultat (fffffffe)

format PE console
entry start

include 'win32a.inc'

; ===============================================
section '.text' code readable executable

start:
    ; The program begins here:

    call    read_hex;eax=a et esi=0
    mul     eax;eax=a*a et esi=0
    mov     esi,eax;esi=a^2 et eax=a^2

    call    read_hex;eax=b et esi=a^2
    mul     eax;eax=b^2 et esi=a^2
    sub     esi,eax;esi=a^2-b^2
    mov     eax,esi;eax=a^2-b^2=esi

    call    print_eax

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

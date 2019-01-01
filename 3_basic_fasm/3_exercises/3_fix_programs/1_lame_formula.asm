; Basic fasm
; ==========
;
; Fix Programs
; ------------
;
; Lame Formula
; @@@@@@@@@@@@
;
; 0.    Try to assemble and find out the assembly error message.
;
; 1.    Fix the code to make the assembly process succeed.
;       mult est une instruction qui n'existe pas, il faut utiliser "mul"
; 2.    Run the program. Make sure that the program behaves correctly.
;

format PE console
entry start

include 'win32a.inc'

; ===============================================
section '.text' code readable executable

start:
    ; The program begins here:

    ; Read three numbers a,b,c:
    call    read_hex    ;eax=a
    mov     ebx,eax     ;eax=a ebx=a
    call    read_hex    ;eax=b ebx=a
    mov     ecx,eax     ;eax=b ebx=a ecx=b
    call    read_hex    ;eax=c ebx=a ecx=b

    mul     ecx         ;eax=c*b ebx=a ecx=b [eax]*[ecx]->[edx:eax]
    add     eax,ebx     ;eax=(c*b)+a ebx=a ecx=b (b * c) + a

    ; Output the result (b * c) + a
    call    print_eax

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

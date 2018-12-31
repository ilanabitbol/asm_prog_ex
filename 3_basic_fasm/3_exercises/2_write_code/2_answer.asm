;2.  Write a program that receives a number x as input, and outputs to the
;    console the following values: x+1, x^2 , x^3, one after another.

format PE console
entry start

include 'win32a.inc'

; ===============================================
section '.text' code readable executable

start:
    ; Your program begins here:
    call    read_hex;eax=a esi=0 edx=0
    mov     ebx,eax;eax=a esi=0 edx=0 ebx=a
    inc     eax;ebx=a eax=a+1 esi=0 edx=0
    call    print_eax
    mov     eax,ebx;ebx=a eax=a esi=0 edx=0
    mov     edx,0
    mul     ebx;{edx:eax}=eax*ebx=a*a
    call    print_eax
    mul     ebx;
    call    print_eax
    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

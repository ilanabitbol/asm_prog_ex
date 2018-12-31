;1.  Write a program that receives two numbers a,b and calculates their integral
;    average.

format PE console
entry start

include 'win32a.inc'

; ===============================================
section '.text' code readable executable

start:
    ; Your program begins here:
    mov     edx,0
    call    read_hex;eax=a esi=0 edx=0
    mov     esi,eax;eax=a esi=a edx=0
    call    read_hex;eax=b esi=a edx=0
    add     esi,eax;eax=b esi=a+b edx=0
    mov     eax,esi;eax=a+b=DIVIDEND esi=a+b edx=0
    mov     ecx,2;eax=a+b esi=a+b edx=0 ebx=DIVISOR=2
    div     ecx; eax <- Quotien de edx:eax / ecx ET edx <- Reste de edx:eax / ecx
    call    print_eax
    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

;3.  Write a program that receives two numbers a,b as input, and outputs the
;    remainder of dividing a by b.

format PE console
entry start

include 'win32a.inc'

; ===============================================
section '.text' code readable executable

start:
    ; Your program begins here:
    mov     edx,0
    call    read_hex;eax=a esi=0 edx=0 ebx=0
    mov     ebx,eax;eax=a esi=0 edx=0 ebx=a
    call    read_hex;eax=b esi=0 edx=0 ebx=a
    mov     esi,eax;eax=a esi=b edx=0 ebx=a
    mov     eax,ebx;eax=a esi=b edx=0 ebx=a
    div     esi;eax={edx:eax}/esi et edx={edx:eax}%esi
    mov     eax,edx
    call    print_eax
    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

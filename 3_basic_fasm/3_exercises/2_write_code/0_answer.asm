;	0.  Write a program the receives three numbers and sums those three numbers.
;		Then output the result.

format PE console
entry start

include 'win32a.inc'

; ===============================================
section '.text' code readable executable

start:
    ; Your program begins here:
    call    read_hex;eax=a esi=0 edx=0
    mov     esi,eax;eax=a esi=a edx=0
    call    read_hex;eax=b esi=a edx=0
    mov     edx,eax;eax=b esi=a edx=b
    call    read_hex;eax=c esi=a edx=b
    add     esi,edx;eax=c esi=a+b edx=b
    add     eax,esi;eax=c+a+b esi=a+b edx=b
    call    print_eax
    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

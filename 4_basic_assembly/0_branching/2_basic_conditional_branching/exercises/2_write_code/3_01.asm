;1.  Write a program that takes three numbers as input: x,y,z. Then it prints 1
;    to the console if x < y < z. It prints 0 otherwise.
;
;    NOTE: The comparison should be in the unsigned sense. That means for
;    example: 0x00000003 < 0x7f123456 < 0xffffffff
;
;		ANSWER:
;
;


format PE console
entry start

include 'win32a.inc'

; ===============================================
section '.text' code readable executable

start:
    ; Your program begins here:

    call    read_hex;eax=x
    mov     ebx,eax;ebx=x eax=x ecx=?
    call    read_hex;ebx=x eax=y ecx=?
    mov     ecx,eax;ebx=x eax=y ecx=y
    call    read_hex;ebx=x eax=z ecx=y
    cmp     ebx,ecx;
    jb      x_inferieur_y;if x<y => jump to label x_inferieur_y
    jmp     false_inegalite;sinon exit
false_inegalite:
    mov     eax,0
    call    print_eax
    jmp     exit

x_inferieur_y:
    cmp     ecx,eax
    jb      true_inegalite;if y<z => jump to labal true_inegalite
    jmp     false_inegalite;else jump to label false_inegalite

true_inegalite:
    mov     eax,1
    call    print_eax
    jmp     exit

exit:
    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

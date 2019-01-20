;0.1 Write a program that takes the value m as input. It then receives m
;      consecutive numbers from the user, sums all those numbers and prints back
;      the total sum to the console.
;
;		ANSWER:
;     On a la valeur m en entrée et on reçoit alors m valeurs en entrée que l'on somme
;


format PE console
entry start

include 'win32a.inc'

; ===============================================
section '.text' code readable executable

start:
    ; Your program begins here:

    call    read_hex;eax=m
    mov     ebx,eax;ebx=m eax=m
    mov     edx,0
sum:
  call  read_hex
  add   edx,eax;edx=eax+edx
  dec   ebx
  cmp		ebx,0;ebx=m-1
	jne		sum;tant que ebx!=0 alors on recommence au label "sum"

print:
	; move the sum to eax to print
	mov		eax, edx
	call 	print_eax

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

[bits 32]
;header: 
;	dd sh
;	dd 0
;	dq 0
;	dq 0
;	dq 0
sh:
	mov edi, [esp + 4]
	pusha
	.start:
	mov eax, PROMPT
	add eax, edi
	call printf
	call gets
	cmp BYTE [eax], 0
	je .start
	mov ebx, eax
	mov eax, 256
	call malloc
	push ebx
	mov ebx, PREFIX
	add ebx, edi
	call strcpy
	pop ebx
	add eax, 5
	mov cl, 0 
	mov edx, 256
	call memccpy
	sub eax, 5 
	push edx
	call printf
	mov edx, 6
	int 0x80
	pop edx
	jmp .start
	call newline
	jmp .start
	.end:
	popa
	ret
	.buffer: dd 0

PROMPT: db '> ', 0
PREFIX: db '/bin/', 0
SHELL: db '/bin/sh/', 0
ERROR_NOT_FOUND: db 'Error: file not found %s.', 10, 0
%include "lib/utils/stdio.asm"
%include "lib/utils/mem.asm"

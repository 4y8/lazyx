[org 0x1000]
[bits 32]
sh:
	pusha
	;mov eax, 256
	;mov edx, 2
	;int 0x80
	;mov [.buffer], eax
	.start:
	mov eax, PROMPT
	add eax, ecx
	mov ebx, 0x1F
	mov edx, 0
	int 0x80
	mov edx, 1
	int 0x80
	mov edx, 0
	int 0x80
	jmp .start
	.end:
	popa
	ret
	.buffer: dd 0

PROMPT: db '> ', 0

[bits 32]
sh:
	pusha
	mov eax, 256
	mov edx, 2
	int 0x80
	mov [.buffer], eax
	.start:
	mov edx, 0
	mov eax, PROMPT
	mov ebx, 0x1F
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

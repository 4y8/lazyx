[bits 32]
header: 
	dd sh
	dd 0
	dq 0
	dq 0
	dq 0
sh:
	mov ecx, [esp + 4]
	pusha
	.start:
	mov eax, PROMPT
	add eax, ecx
	call printf
	call gets
	cmp BYTE [eax], 0
	je .start
	call printf
	call newline
	jmp .start
	.end:
	popa
	ret
	.buffer: dd 0

PROMPT: db '> ', 0
%include "lib/utils/stdio.asm"
%include "lib/utils/mem.asm"

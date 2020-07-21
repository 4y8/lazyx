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
	call printf
	call gets
	call printf
	jmp .start
	.end:
	popa
	ret
	.buffer: dd 0

PROMPT: db 10, '> ', 0
%include "lib/utils/stdio.asm"
%include "lib/utils/mem.asm"

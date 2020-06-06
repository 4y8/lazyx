main:
	push 0xF0
	mov eax, 0
	mov ebx, 0
	mov ecx, 10
	mov edx, 10
	call draw_hline
	jmp $

VIDEO_MEMORY equ 0xA0000
%include "lib/graphics/shapes.asm"

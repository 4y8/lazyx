main:
	mov eax, 40 
	mov ebx, 60
	mov ecx, 0
	mov edx, 0x0F
	call draw_hline
	jmp $

VIDEO_MEMORY equ 0x0A0000
%include "lib/graphics/shapes.asm"

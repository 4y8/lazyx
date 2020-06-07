main:
	mov eax, 0
	mov ebx, 30 
	mov ecx, 0
	mov edx, 0x0F 
	call draw_vline
	pop eax
	jmp $

VIDEO_MEMORY equ 0xA0000
%include "lib/graphics/shapes.asm"

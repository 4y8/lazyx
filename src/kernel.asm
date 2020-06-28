main:
	mov eax, 109 
	mov ebx, 0 
	mov ecx, 0
	mov edx, 0x0F 
	call draw_character
	jmp $

VIDEO_MEMORY equ 0xA0000
%include "lib/graphics/shapes.asm"
%include "lib/graphics/font.asm"

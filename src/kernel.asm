main:
	mov eax, 'e' 
	mov ebx, 30
	mov ecx, 30
	mov edx, 0x0F 
	call draw_character
	pop eax
	jmp $

VIDEO_MEMORY equ 0xA0000
%include "lib/graphics/shapes.asm"
%include "lib/graphics/font.asm"

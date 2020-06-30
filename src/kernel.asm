main:
	mov eax, HELLO
	mov ebx, 8 
	mov ecx, 0
	mov edx, 0x0F
	call draw_string
	jmp $

VIDEO_MEMORY equ 0xA0000
%include "lib/text/text.asm"
%include "lib/graphics/font.asm"
%include "lib/graphics/shapes.asm"

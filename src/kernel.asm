main:
	mov eax, HELLO
	mov ebx, 0x0F
	call print_string
	call print_string
	jmp $

VIDEO_MEMORY equ 0xA0000
%include "lib/text/text.asm"
%include "lib/graphics/font.asm"
%include "lib/graphics/shapes.asm"
%include "driver/screen.asm"
HELLO: db "Hello World!", 10, 0

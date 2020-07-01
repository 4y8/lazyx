main:
	mov eax, HELLO
	mov ebx, 0x0F
	call print_string
	mov ebx, 0x1F
	call print_string
	call print_string
	call print_string
	call print_string
	mov eax, 'a'
	call print_char
	call print_char
	mov eax, 2020
	call kprint_int
	jmp $

OFF equ main - 0x1000  
VIDEO_MEMORY equ 0xA0000
%include "lib/text/text.asm"
; %include "lib/graphics/font.asm"
; %include "lib/graphics/shapes.asm"
%include "driver/screen.asm"
HELLO: db "Hello World!\n", 10, 0

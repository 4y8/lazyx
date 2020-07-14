[org 0x1000]
[bits 32]
main:
	; Hides the cursor
	mov dx, 0x3D4
	mov al, 0xA
	out dx, al
	inc dx
	mov al, 0x20
	out dx, al
	
	; Setup interrupts
	call isr_init
	sti

	mov edx, 0
	mov eax, HELLO
	mov ebx, 0x1F
	int 0x80

	call init_keyboard
	call read_line
	mov ebx, 0x1F
	call print_string
	jmp $

%include "lib/text/text.asm"
%include "driver/screen.asm"
%include "driver/filesystem.asm"
%include "lib/utils/mem.asm"
%include "cpu/idt.asm"
%include "cpu/timer.asm"
%include "driver/keyboard.asm"
FS_END equ file_system + 8192
file_system:
HELLO: db "Hello World!", 10, 0

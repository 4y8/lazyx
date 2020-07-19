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

	call init_keyboard
	;call read_line
	mov ebx, file_system
	mov eax, FS_END
	call load_file
	mov ecx, file_system 
	;call file_system
	mov eax, HELLO
	mov ebx, 0x1F
	mov edx, 0
	int 0x80
	jmp $

%include "lib/text/text.asm"
%include "driver/screen.asm"
%include "driver/filesystem.asm"
%include "lib/utils/mem.asm"
%include "cpu/idt.asm"
%include "driver/keyboard.asm"
FS_END equ file_system + 1024 
HELLO: db 'Hello', 0
file_system:


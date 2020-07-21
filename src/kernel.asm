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
	mov eax, 1024
	call malloc
	mov eax, FS_END
	call load_file
	mov ecx, eax 
	call eax 
	mov edx, 0 
	mov eax, HELLO
	mov ebx, 0x1F
	int 0x80
	jmp $

%include "lib/text/text.asm"
%include "driver/screen.asm"
%include "driver/filesystem.asm"
%include "driver/mem.asm"
%include "lib/utils/mem.asm"
%include "cpu/idt.asm"
%include "driver/keyboard.asm"
FS_END equ file_system + 1024 
HELLO: db 'Hello', 0
file_system:


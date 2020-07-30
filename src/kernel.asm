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

	inc DWORD [fs_size]
	call init_keyboard
	mov eax, FILE
	call exec_file
	mov eax, FILE 
	call load_file
	jmp $

%include "lib/text/text.asm"
%include "driver/screen.asm"
%include "driver/filesystem.asm"
%include "driver/mem.asm"
%include "lib/utils/mem.asm"
%include "lib/utils/stdio.asm"
%include "cpu/idt.asm"
%include "driver/keyboard.asm"
FS_END equ file_system + 1024 
HELLO: db 'Hello', 0
FILE: db '/bin/sh', 0
file_system:


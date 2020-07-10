[org 0x1000]
[bits 32]
main:
	mov ebx, 0x1F
	mov eax, KERNEL_LOAD
	call print_string

	; Hides the cursor
	mov dx, 0x3D4
	mov al, 0xA
	out dx, al
	inc dx
	mov al, 0x20
	out dx, al
	
	call isr_init
	int 2 
	jmp $

%include "lib/text/text.asm"
%include "driver/screen.asm"
%include "driver/filesystem.asm"
%include "lib/utils/mem.asm"
%include "cpu/idt.asm"
KERNEL_LOAD: db "Kernel loaded!", 10, 0
FS_END equ file_system + 8192
file_system:

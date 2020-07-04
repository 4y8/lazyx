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
	push KERNEL_LOAD
	push 0
	push 0
	push 0
	push 16 
	push 0
	push 0
	push 0
	push 0
	push 0
	push 0
	push KERNEL_LOAD
	call create_file
	pop eax
	pop eax
	pop eax
	pop eax
	pop eax
	pop eax
	pop eax
	pop eax
	pop eax
	pop eax
	pop eax
	mov ebx, file_system
	mov eax, 0x10000
	call load_file
	mov ebx, 0x1F
	call print_string
	jmp $

OFF equ main - 0x1000  
VIDEO_MEMORY equ 0xA0000
%include "lib/text/text.asm"
; %include "lib/graphics/font.asm"
; %include "lib/graphics/shapes.asm"
%include "driver/screen.asm"
%include "driver/filesystem.asm"
%include "lib/utils/mem.asm"
KERNEL_LOAD: db "Kernel loaded!", 10, 0
; UStar File system
file_system:

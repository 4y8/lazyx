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
	mov eax, FS_END
	mov ebx, file_system + 1024
	call load_file
	;mov eax, file_system + 0x204
	mov eax, FS_END
	mov ebx, 0x1F
	call print_string
	mov eax, 0
	call kprint_int
	jmp $

%include "lib/text/text.asm"
%include "driver/screen.asm"
%include "driver/filesystem.asm"
%include "lib/utils/mem.asm"
KERNEL_LOAD: db "Kernel loaded!", 10, 0
FS_END equ file_system + 8192
file_system:

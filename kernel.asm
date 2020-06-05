[org 0x7c00]

	mov bp, 0x9000
	mov sp, bp 
	call switch_to_pm
	jmp $

; GDT

BEGIN_PM:
	mov edx, VIDEO_MEMORY
	mov al, 80
	mov ah, 0x0f
	mov [edx], ax
times 510-($-$$) db 0
dw 0xaa55


gdt_start:

gdt_null: ; The null descriptor
	dd 0x0
	dd 0x0

gdt_code:
	dw 0xffff
	dw 0x0
	db 0x0
	db 10011010b
	db 11001111b
	db 0x0

gdt_data:
	dw 0xffff
	dw 0x0
	db 0x0
	db 10011010b
	db 11001111b
	db 0x0

gdt_end:

gdt_descriptor:
	dw gdt_end - gdt_start - 1
	dd gdt_start

[bits 16]
switch_to_pm:
	cli
	lgdt [gdt_descriptor]
	mov eax, cr0
	or eax, 0x1
	mov cr0, eax
	jmp CODE_SEG:init_pm


[bits 32]
init_pm:
	mov ax, DATA_SEG
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	mov ebp, 0x90000
	mov esp, ebp

	call BEGIN_PM

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
VIDEO_MEMORY equ 0xb8000


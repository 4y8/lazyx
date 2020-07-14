[org 0x7c00]
[bits 16]
	mov bp, 0x9000
	mov sp, bp
	mov ax, 0x3 ; Set the Video mode to 3h, Text 80x25 16 colours
	int 0x10

kernel_disk_load:
	mov bx, 0x1000 
	mov ah, 0x02
	mov al, 15 
	mov ch, 0x00
	mov dh, 0x00
	mov cl, 0x02
	int 0x13

	call switch_to_pm
	jmp $

; GDT

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
	db 10010010b
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

BEGIN_PM:
	call 0x1000
	jmp $

times 510-($-$$) db 0
dw 0xaa55

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start


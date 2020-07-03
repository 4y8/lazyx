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
	mov eax, file_system + 4
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
	times 0x1000 dd 0
;	first_file:
;	times 100 db 0 ; File name
;	times 8   db 0 ; File mode
;	times 8   db 0 ; Owner's id
;	times 8   db 0 ; Group's id
;	times 12  db 0 ; File size
;	times 12  db 0 ; Last modification time
;	times 8   db 0 ; Checksum
;	times 1   db 0 ; Type flag
;	times 100 db 0 ; Linked file name
;	times 6   db 0 ; UStar indicator
;	times 2   db 0 ; UStar version
;	times 32  db 0 ; Owner's name
;	times 32  db 0 ; Group's name
;	times 8   db 0 ; Device major number
;	times 8   db 0 ; Device minor number
;	times 155 db 0 ; Filename prefix


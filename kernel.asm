main:
	mov edx, VIDEO_MEMORY
	mov al, 80
	mov ah, 0x0f
	mov [edx], ax
	jmp $

VIDEO_MEMORY equ 0xb8000


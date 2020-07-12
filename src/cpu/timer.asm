init_timer:
	pusha
	push eax
	push ebx
	mov eax, 0
	mov ebx, timer_callback
	call set_irq_handler
	pop ebx
	pop eax
	mov edx, 0
	mov ecx, eax
	mov eax, 1193180
	idiv ecx
	mov ecx, eax
	mov dx, 0x43
	mov al, 0x36
	out dx, al
	mov dx, 0x40
	mov al, cl
	out dx, al
	mov al, ah
	out dx, al
	popa
	ret

timer_callback:
	inc DWORD [.tick]
	mov eax, TICK
	mov ebx, 0x1F
	call print_string
	mov eax, [.tick]
	call kprint_int
	mov eax, 10
	call print_char
	ret
	.tick: dd 0

TICK: db "Tick: ", 0

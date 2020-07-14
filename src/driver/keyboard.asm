scancode_to_ascii:
	db 0   
	db 27  
	db '1'  
	db '2' 
	db '3'
	db '4'
	db '5'
	db '6'
	db '7'
	db '8'
	db '9'
	db '0'
	db '-'
	db '='
	db 8
	db 9
	db 'q'
	db 'w'
	db 'e'
	db 'r'
	db 't'
	db 'y'
	db 'u'
	db 'i'
	db 'o'
	db 'p'
	db '['
	db ']'
	db 10
	db 0
	db 'a'
	db 's'
	db 'd'
	db 'f'
	db 'g'
	db 'h'
	db 'j'
	db 'k'
	db 'l'
	db ';'
	db "'" 
	db '`'
	db 0
	db '\'
	db 'z'
	db 'x'
	db 'c'
	db 'v'
	db 'b'
	db 'n'
	db 'm'
	db ','
	db '.'
	db '/'
	db 0
	db '*'
	db 0
	db ' '
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db '7'
	db '8'
	db '9'
	db '-'
	db '4'
	db '5'
	db '6'
	db '+'
	db '1'
	db '2'
	db '3'
	db '0'
	db '.'
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 10 
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db '/' 
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0

init_keyboard:
	mov eax, 1
	mov ebx, keyboard_callback
	call set_irq_handler
	ret

keyboard_callback:
	mov eax, 0
	mov dx, 0x60
	in al, dx
	mov al, [scancode_to_ascii + eax]
	mov ebx, [keyboard_buffer_i]
	add ebx, keyboard_buffer
	inc BYTE [keyboard_buffer_i]
	mov [ebx], al
	ret

keyboard_buffer: times 512 db 0
keyboard_buffer_i: dd 0

; Wait for a keypress and put the ascii code of the pressed key in eax
read_char:
	push ecx
	xor eax, eax
	.start:
	mov al, [keyboard_buffer_i]
	cmp al, 0
	je .start
	.end:
	mov eax, [keyboard_buffer_i]
	add eax, keyboard_buffer - 1
	mov cl, [eax]
	cmp cl, 0
	je .start
	xor eax, eax
	mov al, cl
	push ebx
	mov ebx, 0x1F
	call print_char
	pop ebx
	dec BYTE [keyboard_buffer_i]
	pop ecx
	ret

read_line:
	push ebx
	push ecx
	mov ecx, 0
	mov eax, 256
	call malloc
	mov ebx, eax
	.loop:
	call read_char
	cmp al, 10 
	je .end
	mov [ebx + ecx], al
	inc ecx
	jmp .loop
	.end:
	mov BYTE [ebx + ecx], 0
	mov eax, ebx
	pop ecx
	pop ebx
	ret
	.buffer: times 256 db 0

key_pressed: db 0

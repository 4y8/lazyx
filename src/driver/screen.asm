cursor_x: db 0
cursor_y: db 0


load_cursor_pos:
	push ecx
	push edx
	push esi
	mov eax, 0xB8000
	mov edx, [cursor_y - OFF]
	and edx, 0xFF
	mov esi, edx ; Multiply edx by 80, 80 * edx = 64 * edx + 16 * edx
	shl esi, 4   ;                              = edx << 6 + edx << 4
	shl edx, 6
	add edx, esi
	mov ecx, [cursor_x - OFF]
	and ecx, 0xFF
	add edx, ecx
	shl edx, 1
	add eax, edx
	pop esi
	pop edx
	pop ecx
	ret


; Prints the string at the memory position eax on the screen and of colour ebx.
print_string:
	pusha
	sub eax, OFF
	push eax
	call load_cursor_pos
	mov edi, eax
	pop eax
	shl bx, 8
	.start:
	mov bl, [eax] 
	cmp bl, 0
	je .end
	cmp bl, 10 ; Check for newline 
	jne .continue
	inc BYTE [cursor_y - OFF]
	mov edi, [cursor_y - OFF]
	imul edi, 160
	add edi, 0xB8000
	mov BYTE [cursor_x - OFF], -1 
	.continue:
	mov [edi], bx
	inc eax
	inc BYTE [cursor_x - OFF]
	add edi, 2
	jmp .start
	.end:
	popa
	ret	

; Print the character eax of the colour ebx
print_char:
	pusha
	push eax
	call load_cursor_pos
	mov edi, eax
	pop eax
	shl bx, 8 
	cmp al, 10
	jne .end
	mov BYTE [cursor_x - OFF], 0 
	inc BYTE [cursor_y - OFF]
	popa
	ret 
	.end:
	mov bl, al
	mov [edi], bx
	inc BYTE [cursor_x - OFF]
	popa
	ret

; Print the integer eax of colour ebx
kprint_int:
	pusha
	mov edi, .kprint_buffer + 126 - OFF
	.start:
	mov edx, 0
	mov ecx, 10
	div ecx
	mov ecx, edx
	or ecx, eax
	cmp ecx, 0
	je .end
	add edx, '0' 
	mov [edi], dl 
	dec edi
	jmp .start
	.end:
	inc edi
	add edi, OFF
	mov eax, edi
	call print_string
	popa
	ret
	.kprint_buffer: times 128 db 0 

kprintf:
	

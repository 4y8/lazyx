cursor_x: db 0
cursor_y: db 0

; Create a newline and manage auto-scrolling
new_line:
	push eax
	inc BYTE [cursor_y]
	mov BYTE [cursor_x], 0
	mov al, [cursor_y]
	cmp al, 25 
	jne .end
	push ecx
	push ebx
	mov eax, 0xB8000
	mov ebx, 0xB8000 + 160
	mov ecx, 4000
	call memcpy
	dec BYTE [cursor_y]
	pop ebx
	pop ecx
	.end:
	pop eax
	ret

add_char:
	push eax
	inc BYTE [cursor_x]
	mov al, [cursor_x]
	cmp al, 80
	jne .end
	call new_line
	.end:
	pop eax
	ret

load_cursor_pos:
	push ecx
	push edx
	push esi
	mov eax, 0xB8000
	mov edx, [cursor_y]
	and edx, 0xFF
	mov esi, edx ; Multiply edx by 80, 80 * edx = 64 * edx + 16 * edx
	shl esi, 4   ;                              = edx << 6 + edx << 4
	shl edx, 6
	add edx, esi
	mov ecx, [cursor_x]
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
	call new_line
	mov edi, [cursor_y]
	and edi, 0xFF
	imul edi, 160
	add edi, 0xB8000
	inc eax
	jmp .start
	.continue:
	mov [edi], bx
	inc eax
	call add_char
	add edi, 2
	jmp .start
	.end:
	popa
	ret	

; Prints the character eax of the colour ebx.
print_char:
	pusha
	push eax
	call load_cursor_pos
	mov edi, eax
	pop eax
	shl bx, 8 
	cmp al, 10
	jne .end
	call new_line
	popa
	ret 
	.end:
	mov bl, al
	mov [edi], bx
	call add_char
	popa
	ret

; Prints the integer eax of colour ebx.
kprint_int:
	pusha
	mov edi, .kprint_buffer + 126	
	cmp eax, 0
	je .zero
	.start:
	xor edx, edx 
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
	.zero:
	mov BYTE [edi], '0'
	dec edi
	.end:
	inc edi
	mov eax, edi
	call print_string
	popa
	ret
	.kprint_buffer: times 128 db 0 

; Printf the string at address eax with the arguments pushed right-first on the
; stack. The colour of the string is in ebx.
kprintf:
	push eax
	push ecx
	push edx
	mov ecx, 20
	.main_loop:
	mov dl, [eax]
	cmp dl, 0
	je .end
	cmp dl, '%'
	jne .normal_char
	.special_char:
	inc eax
	mov dl, [eax]
	push eax
	mov eax, [esp + ecx]
	add ecx, 4
	cmp dl, 'd'
	jne .aft1
	call kprint_int
	jmp .end_spe
	.aft1:
	cmp dl, 's'
	jne .aft2
	call print_string
	jmp .end_spe
	.aft2:
	call print_char
	.end_spe:
	pop eax
	inc eax
	jmp .main_loop
	.normal_char:
	cmp dl, '\'
	je .escape_char
	push eax
	mov al, dl
	call print_char
	pop eax
	inc eax
	jmp .main_loop
	.escape_char:
	inc eax
	mov dl, [eax]
	cmp dl, 'n'
	jne .non_nl
	mov byte [cursor_x], 0
	inc BYTE [cursor_y]
	jmp .end_esc 
	.non_nl:
	.end_esc:
	inc eax
	jmp .main_loop
	.end:
	pop edx
	pop ecx
	pop eax
	ret

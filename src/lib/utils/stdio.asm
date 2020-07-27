; Prints the screen at the address eax
puts:
	push eax
	push ebx
	push edx
	mov ebx, 0x1F
	xor edx, edx
	int 0x80
	mov eax, 10
	call putchar
	pop edx
	pop ebx
	pop eax
	ret

; Reads a string from user input and return its address in eax
gets:
	push edx
	mov edx, 1
	int 0x80
	pop edx
	ret

; Reads a character from user input and return it in eax
getchar:
	push ebx
	push edx
	xor ebx, ebx
	mov edx, 1
	int 0x80
	mov bl, [eax]
	xor eax, eax
	mov al, bl
	pop edx
	pop ebx
	ret

; Puts the char in eax
putchar:
	push ebx
	push edx
	push eax
	mov eax, 2
	mov edx, 2
	int 0x80
	mov ebx, eax
	pop eax
	mov [ebx], al
	mov BYTE [ebx + 1], 0
	mov eax, ebx
	xor edx, edx
	mov ebx, 0x1F
	int 0x80
	add edx, 3
	int 0x80
	pop edx
	pop ebx
	ret

; Prints a new line
newline:
	push eax
	mov eax, 10
	call putchar
	pop eax
	ret

; Prints the integer eax of colour ebx.
print_int:
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
	call puts 
	popa
	ret
	.kprint_buffer: times 128 db 0 

; Printf the string at address eax with the arguments pushed right-first on the
; stack.
printf:
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
	call print_int
	jmp .end_spe
	.aft1:
	cmp dl, 's'
	jne .aft2
	call puts 
	jmp .end_spe
	.aft2:
	call putchar
	.end_spe:
	pop eax
	inc eax
	jmp .main_loop
	.normal_char:
	cmp dl, '\'
	je .escape_char
	push eax
	mov al, dl
	call putchar
	pop eax
	inc eax
	jmp .main_loop
	.escape_char:
	inc eax
	mov dl, [eax]
	cmp dl, 'n'
	jne .non_nl
	push eax
	mov eax, 10
	call putchar
	pop eax
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

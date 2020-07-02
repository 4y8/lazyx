; Create a file with the following parameters on the stack:
; [esp] - address
;         *name
;         user id (64 bits, higher firsts)
;         group id (64 bits, higher firsts)
;         size (96 bits, higher firsts)
;         *user name
;         *group name
;         *path
;         *content

create_file:
	push eax
	push ebx
	push ecx
	push edx
	push edi
	mov edi, file_system - OFF
	.main_loop:
	mov dx, [edi + 263 - OFF] ; Check if the block is used
	cmp dx, 4848
	xor edx, edx
	xor ebx, ebx
	jne .allocate_block
	.get_file_size:
	mov dl, 0
	.file_size_loop:
	cmp dl, 12
	je .file_size_end
	shl ecx, 3
	mov dh, [edi + 124 + ebx - OFF]
	add ecx, edx
	sub ecx, '0'
	dec dl
	jmp .file_size_loop
	.file_size_end:
	; Round up the size to 512 (size of a sector).
	add ebx, 511 ; ebx += 511
	shr ebx, 9   ; ebx /= 512
	inc ebx      ; ++ebx
	shl ebx, 9   ; ebx *= 512
	add edi, ebx
	.allocate_block:
	; Cleans the space of the file's name
	mov eax, 0	
	mov ebx, 100
	rep stosb
	; Copy the file's name
	mov eax, edi
	mov ebx [esp + 24]
	call strcpy
	; Copy user id
	add edi, 108
	mov eax, [esp + 28]
	mov ebx, [esp + 34]
	mov [edi], eax
	mov [edi + 4], ebx
	; Copy group id
	add edi, 8
	mov eax, [esp + 38]
	mov ebx, [esp + 42]
	mov [edi], eax
	mov [edi + 4], ebx
	pop edi
	pop edx
	pop ecx
	pop ebx
	pop eax
	ret

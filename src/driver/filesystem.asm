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

find_free_block:
	push edx
	push edi
	.find_free_block:
	mov edx, [edi]
	cmp edx, 0 
	je .end
	add edi, 512
	jmp .find_free_block
	.end:
	pop edi
	pop edx
	ret

create_file:
	push eax
	push ebx
	push ecx
	push edx
	push edi
	mov edi, file_system - OFF
	call find_free_block
	add edi, 3
	; Copy the file's name
	mov eax, edi
	mov ebx, [esp + 24]
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
	; Copy file size
	add edi, 8
	mov eax, [esp + 46]
	mov ebx, [esp + 50]
	mov ecx, [esp + 54]
	mov [edi], eax
	mov [edi + 4], ebx
	mov [edi + 8], ecx
	; Copy owner's name
	add edi, 126
	mov eax, edi
	mov ebx, [esp + 58]
	call strcpy
	; Copy group's name
	add edi, 32
	mov eax, edi
	mov ebx, [esp + 62]
	call strcpy
	; Copy the path
	add edi, 48
	mov eax, edi
	mov ebx, [esp + 66]
	.get_file_size:
	mov ecx, 0
	mov eax, [esp + 46]
	mov dl, 0
	.file_size_loop:
	cmp dl, 12
	je .file_size_end
	shl ecx, 3
	mov bl, [eax]
	add ecx, ebx
	sub ecx, '0'
	dec dl
	inc eax
	jmp .file_size_loop
	.file_size_end:
	add edi, 155
	mov esi, edi
	call find_free_block
	mov [esi - 512], edi
	.store_file:
	cmp ecx, 508
	jle .end	
	call find_free_block
	sub ecx, 508
	jmp .store_file
	.end:
	pop edi
	pop edx
	pop ecx
	pop ebx
	pop eax
	ret

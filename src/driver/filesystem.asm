; Search from edi a block of free memory in the file system and stores its
; address in edi.
find_free_block:
	push edx
	.find_free_block:
	mov edx, [edi]
	cmp edx, 0 
	je .end
	add edi, 512
	jmp .find_free_block
	.end:
	pop edx
	ret

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
	call find_free_block
	mov BYTE [edi], -1
	inc edi
	; Copy the file's name
	add edi, OFF
	mov eax, edi
	sub edi, OFF
	mov ebx, [esp + 24]
	call strcpy
	; Copy user id
	add edi, 108
	mov eax, [esp + 28]
	mov ebx, [esp + 32]
	mov [edi], eax
	mov [edi + 4], ebx
	; Copy group id
	add edi, 8
	mov eax, [esp + 36]
	mov ebx, [esp + 40]
	mov [edi], eax
	mov [edi + 4], ebx
	; Copy file size
	add edi, 8
	mov eax, [esp + 44]
	mov ebx, [esp + 48]
	mov ecx, [esp + 52]
	mov [edi], eax
	mov [edi + 4], ebx
	mov [edi + 8], ecx
	; Copy owner's name
	add edi, 137 
	add edi, OFF
	mov eax, edi
	sub edi, OFF
	mov ebx, [esp + 56]
	call strcpy
	; Copy group's name
	add edi, 32
	add edi, OFF
	mov eax, edi
	sub edi, OFF
	mov ebx, [esp + 60]
	call strcpy
	; Copy the path
	add edi, 48
	add edi, OFF
	mov eax, edi
	sub edi, OFF
	mov ebx, [esp + 64]
	call strcpy
	.get_file_size:
	mov ebx, 0
	mov ecx, 0
	mov edx, 0
	mov eax, 44
	mov cl, 0
	.file_size_loop:
	cmp cl, 3 
	je .file_size_end
	shl edx, 8 
	add edx, [esp + eax] 
	inc cl
	add eax, 4 
	jmp .file_size_loop
	.file_size_end:
	add edi, 170
	mov esi, edi
	sub esi, 4 
	mov ebx, [esp + 68]
	mov ecx, 512
	.store_file:
	cmp edx, 508
	jle .end	
	call find_free_block
	mov [esi], edi
	mov esi, edi	
	add edi, OFF
	mov eax, edi
	sub edi, OFF
	add eax, 4
	call memcpy
	add ebx, 508
	sub edx, 508
	jmp .store_file
	.end:
	call find_free_block
	mov [esi], edi
	mov DWORD [edi], 0 
	add edi, 4
	add edi, OFF
	mov eax, edi
	mov ecx, edx
	call memcpy
	pop edi
	pop edx
	pop ecx
	pop ebx
	pop eax
	ret

; Load the file with its descriptor at the address ebx, at the address eax. 
load_file:
	pusha
	mov edx, 0
	add ebx, 125
	sub ebx, OFF
	mov cl, 0
	.get_size:
	cmp cl, 3 
	je .end_size
	shl edx, 8
	add edx, [ebx]
	add ebx, 4
	inc cl
	jmp .get_size
	.end_size:
	add ebx, 371
	mov ecx, 508
	.loop:
	cmp edx, 508
	jle .end
	add ebx, OFF + 4
	call memcpy
	sub ebx, OFF - 4
	add eax, 508
	mov ebx, [ebx]
	sub edx, 508
	jmp .loop
	.end:
	mov ebx, [ebx]
	add ebx, 4
	mov ecx, edx
	add ebx, OFF
	call memcpy
	popa
	ret

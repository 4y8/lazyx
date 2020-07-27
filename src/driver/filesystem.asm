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
	sub edi, file_system
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
	mov edi, file_system
	call find_free_block
	add edi, file_system
	mov BYTE [edi], 255 
	inc edi
	; Copy the file's name
	mov eax, edi
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
	mov eax, edi
	mov ebx, [esp + 56]
	call strcpy
	; Copy group's name
	add edi, 32
	mov eax, edi
	mov ebx, [esp + 60]
	call strcpy
	; Copy the path
	add edi, 48
	mov eax, edi
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
	shl edx, 32
	add edx, [esp + eax] 
	inc cl
	add eax, 4 
	jmp .file_size_loop
	.file_size_end:
	add edi, 170
	mov esi, edi
	sub esi, 4
	mov ebx, [esp + 68]
	mov ecx, 508
	.store_file:
	cmp edx, 508
	jle .end
	mov DWORD [esi], 1
	call find_free_block
	mov [esi], edi
	add edi, file_system
	mov esi, edi	
	mov eax, edi
	add eax, 4
	call memcpy
	add ebx, 508
	sub edx, 508
	jmp .store_file
	.end:
	mov DWORD [esi], 1
	call find_free_block
	mov [esi], edi
	add edi, file_system
	mov DWORD [edi], 1
	add edi, 4
	mov eax, edi
	mov ecx, edx
	call memcpy
	pop edi
	pop edx
	pop ecx
	pop ebx
	pop eax
	ret

get_file_size:
	push ecx
	push edx
	add eax, 125
	mov ecx, 3
	.get_size:
	shl edx, 32 
	add edx, [eax]
	add eax, 4
	loop .get_size
	mov eax, ebx
	pop edx
	pop ecx
	ret

; Load the file with its descriptor at the address ebx, at the address eax. 
load_file:
	pusha
	push eax
	mov eax, ebx
	call get_file_size
	mov edx, eax
	pop eax
	add ebx, 508 
	mov ecx, 508
	mov ebx, [ebx]
	.loop:
	cmp edx, 508
	jle .end
	add ebx, 4 + file_system
	call memcpy
	sub ebx, 4
	add eax, 508
	mov ebx, [ebx]
	sub edx, 508
	jmp .loop
	.end:
	add ebx, 4 + file_system
	mov ecx, edx
	mov ecx, 508
	call memcpy
	popa
	ret

load_file_with_path:
	push esi
	push edi
	push edx
	push ecx
	push ebx

	mov esi, 0
	mov edi, eax
	
	.get_name_loop:
	mov cl, [edi]
	cmp cl, '/'
	cmove esi, edi
	cmp cl, 0
	je .after_loop_name
	inc edi
	jmp .get_name_loop
	.after_loop_name:

	push eax
	mov eax, 166
	call malloc
	mov ecx, eax
	mov eax, 108
	call malloc
	mov edx, eax
	pop eax

	push ebx
	push ecx
	push eax
	inc esi
	push esi
	
	sub esi, eax
	mov ebx, eax
	mov eax, ecx
	mov ecx, esi
	call memcpy
	mov BYTE [eax + esi], BYTE 0
	
	pop esi

	mov eax, edx
	mov ebx, esi
	call strcpy 

	pop eax
	pop ecx
	pop ebx

	mov esi, file_system

	.loop:

	mov eax, esi

	mov bl, [esi]
	cmp bl, -1 
	jne .continue

	mov eax, esi
	inc eax

	mov ebx, edx

	call strcmp
	cmp eax, 0
	jne .continue

	mov eax, esi
	add eax, 342
	mov ebx, ecx
	call strcmp
	cmp eax, 0
	jne .continue

	je .end

	.continue:
	add esi, 512
	jmp .loop

	.end:

	mov ebx, esi
	call get_file_size
	call malloc
	call load_file

	pop ebx
	pop ecx
	pop edx
	pop edi
	pop esi
	ret

; Delete the file with its descriptor at the address eax.
delete_file:
	pusha
	mov ebx, eax
	mov eax, [eax + 508]
	mov DWORD [ebx], 0
	.loop:
	cmp eax, 0 
	je .end
	mov ecx, [eax]
	mov DWORD [eax], 0
	mov eax, [ecx]
	jmp .loop
	.end:
	popa
	ret

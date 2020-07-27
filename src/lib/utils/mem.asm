; Copies ecx bytes from ebx to eax
memcpy:
	pusha
	.main_loop:
	cmp ecx, 0
	je .end
	mov dl, [ebx]
	mov [eax], dl
	inc eax
	inc ebx
	dec ecx
	jmp .main_loop
	.end:
	popa
	ret

; Copies a maximum of edx bytes from ebx to eax until the byte in cl is found
memccpy:
	pusha
	.main_loop:
	cmp edx, 0
	je .end
	mov dl, [ebx]
	cmp dl, cl
	je .end
	mov [eax], dl
	inc eax
	inc ebx
	dec edx
	jmp .main_loop
	.end:
	popa
	ret

; Copies the string from ebx to eax
strcpy:
	pusha
	.main_loop:
	mov cl, [ebx]
	mov [eax], cl
	cmp cl, 0
	je .end
	inc eax
	inc ebx
	jmp .main_loop
	.end:
	popa
	ret

; Allocate eax bytes of memory, and return the address of the allocated memory
; in eax
malloc:
	push edx
	mov edx, 2
	int 0x80
	pop edx
	ret

free:
	push edx
	mov edx, 3
	int 0x80
	pop edx
	ret

; Compares the string at address eax and ebx and return 0 in eax if they are 
; equal
strcmp:
	push ebx
	push ecx
	.loop:
	mov cl, [eax]
	mov ch, [ebx]
	cmp cl, ch
	jne .end
	cmp cl, 0
	jne .continue
	pop ecx
	pop ebx
	mov eax, 0
	ret
	.continue:
	inc eax
	inc ebx
	jmp .loop
	.end:
	mov eax, 1
	pop ecx
	pop ebx
	ret

; Returns the length of the string stored at the address eax
strlen:
	push ecx
	push ebx
	.loop:
	mov cl, [eax]
	cmp cl, 0
	je .end
	inc ebx
	inc eax
	jmp .loop
	.end:
	mov eax, ebx
	pop ebx
	pop ecx
	ret

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
	push ebx
	mov ebx, [.p]
	add [.p], eax
	mov eax, ebx
	add ebx, FS_END
	pop ebx
	ret
	.p : dd 0

free:
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
	.end
	mov eax, 1
	pop ecx
	pop ebx
	ret

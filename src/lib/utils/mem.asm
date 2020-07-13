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

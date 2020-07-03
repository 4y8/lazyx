; Copies ecx bytes from ebx to eax
memcpy:
	pusha
	.main_loop:
	cmp ecx, 0
	je .end
	mov cl, [ebx]
	mov [eax], cl
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
	cmp cl, 0
	je .end
	mov cl, [ebx]
	mov [eax], cl
	inc eax
	inc ebx
	dec ecx
	jmp .main_loop
	.end:
	mov BYTE [eax + 1], 0
	popa
	ret

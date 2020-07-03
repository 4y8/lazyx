; Copies ecx bytes from ebx to eax
memcpy:
	pusha
	sub eax, OFF
	sub ebx, OFF
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
	sub eax, OFF
	sub ebx, OFF
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

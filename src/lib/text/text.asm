[bits 32]
; Draws the null-terminated string at memory address eax, on position ebx, ecx
; and of colour edx
draw_string:
	pusha
	mov edi, 0xB8000
	sub eax, main
	imul ecx, 80
	add ecx, ebx
	shl ecx, 1
	add edi, ecx
	mov dh, dl
	.start:
	mov dl, [eax] 
	cmp dl, 0
	je .end
	mov [edi], dx
	inc eax
	add edi, 2
	jmp .start
	.end:
	popa
	ret

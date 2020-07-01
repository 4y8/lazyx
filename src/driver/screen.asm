cursor_x: db 0
cursor_y: db 0

; Prints the string at the memory position eax on the screen and of colour ebx.
print_string:
	pusha
	mov edi, 0xB8000
	sub eax, main
	mov edx, [cursor_y - main]
	and edx, 0xFF
	imul edx, 80
	mov ecx, [cursor_x - main]
	and ecx, 0xFF
	add edx, ecx
	shl edx, 1
	add edi, edx
	mov bh, bl
	.start:
	mov bl, [eax] 
	cmp bl, 0
	je .end
	cmp bl, 10 ; Check for newline 
	jne .continue
	inc BYTE [cursor_y - main]
	mov edi, [cursor_y - main]
	imul edi, 160
	add edi, 0xB8000
	mov BYTE [cursor_x - main], -1 
	.continue:
	mov [edi], bx
	inc eax
	inc BYTE [cursor_x - main]
	add edi, 2
	jmp .start
	.end:
	popa
	ret	

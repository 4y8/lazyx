; Draw a pixel of colour stored in ecx, at x eax and y ebx.
draw_pixel:
	push eax ; Save registers
	push ebx
	imul ebx, 320 
	add eax, ebx
	add eax, VIDEO_MEMORY
	mov [eax], ecx ; Move the color to x + 320 * y
	pop ebx ; Restore registers
	pop eax
	ret

; Draw a horizontal line starting at the point eax, of size ebx at the y 
; coordinate ecx and of the color edx.
draw_hline:
	push eax
	push ebx
	push ecx
	push edi
	imul ecx, 320
	mov edi, VIDEO_MEMORY
	add edi, eax
	add edi, ecx
	mov ecx, ebx
	mov eax, edx
	rep stosb
	pop edi
	pop ecx
	pop ebx
	pop eax
	ret

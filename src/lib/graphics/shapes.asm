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

; Draw a rectangle of size ecx * edx, with the top-left corner of coordinates
; eax, ebx and with the color on the top of the stack
draw_rectangle:
	push edx
	push ecx
	push edi
	push esi
	push ebx
	push edx
	mov ebx, ecx
	mov edx, [esp + 28]
	add [esp], ebx
	loop:
		mov ecx, [esp]
		mov edi, [esp + 4]
		cmp edi, ecx
		je end
		call draw_hline
		dec ecx
		mov [esp], ecx
		jmp loop
	end:
		pop edx
		pop ebx
		pop esi
		pop edi
		pop ecx
		pop edx
		ret

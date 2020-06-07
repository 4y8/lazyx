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

; Draw a horizontal line starting at the point eax, ecx, of size ebx and of 
; the colour edx.
draw_hline:
	push eax ; Save registers
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
	pop edi ; Restore registers
	pop ecx
	pop ebx
	pop eax
	ret

; Draw a vertical starting at the point eax, ecx, of size ebx and of 
; the colour edx.
draw_vline:
	push ecx
	push ebx
	add ebx, ecx
	mov ecx, edx
	draw_vline_loop:
		cmp ebx, eax
		je draw_vline_end
		call draw_pixel
		dec ebx
		jmp draw_vline_loop
	draw_vline_end:
		pop ebx
		pop ecx
		ret
	

; Draw a rectangle of size ecx * edx, with the top-left corner of coordinates
; eax, ebx and with the colour on the top of the stack
draw_rectangle:
	push edx
	push ecx
	push edi
	push esi
	push ebx
	push edx
	add [esp], ebx
	mov ebx, ecx
	mov edx, [esp + 28]
	draw_rectangle_loop:
		mov ecx, [esp]
		mov edi, [esp + 4]
		cmp edi, ecx
		je draw_rectangle_end
		call draw_hline
		dec ecx
		mov [esp], ecx
		jmp draw_rectangle_loop
	draw_rectangle_end:
		pop edx
		pop ebx
		pop esi
		pop edi
		pop ecx
		pop edx
		ret

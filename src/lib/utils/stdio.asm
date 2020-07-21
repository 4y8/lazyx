; Prints the screen at the address eax
puts:
	push ebx
	push edx
	mov ebx, 0x1F
	xor edx, edx
	int 0x80
	pop edx
	pop ebx
	ret

; Reads a string from user input and return its address in eax
gets:
	push edx
	mov edx, 1
	int 0x80
	pop edx
	ret

; Reads a character from user input and return it in eax
getchar:
	push ebx
	push edx
	xor ebx, ebx
	mov edx, 1
	int 0x80
	mov bl, [eax]
	xor eax, eax
	mov al, bl
	pop edx
	pop ebx
	ret

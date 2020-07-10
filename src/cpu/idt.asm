idt_entries:
	times 2047 db 0 

idt_ptr:
	dw 2047
	dd idt_entries

idt_set_gate:
	push eax
	push ebx
	add ebx, idt_entries
	mov [ebx], ax
	add ebx, 2
	mov WORD [ebx], 0x08
	add ebx, 2
	mov BYTE [ebx], 0x8E
	shr eax, 16
	mov [ebx], ax
	pop ebx
	pop eax
	ret

load_idt:
	lidt [idt_ptr]

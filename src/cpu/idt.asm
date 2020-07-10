idt_entries:
	times 2048 db 0 

idt_ptr:
	dw 2047
	dd idt_entries

idt_set_gate:
	shl ebx, 6 
	add ebx, idt_entries
	mov [ebx], ax
	add ebx, 2
	mov WORD [ebx], 0x08
	add ebx, 3
	mov BYTE [ebx], 0x8E
	inc ebx
	shr eax, 16
	mov [ebx], ax
	ret

isr_init:
	mov eax, isr0
	mov ebx, 0
	call idt_set_gate

	mov eax, isr1
	mov ebx, 1 
	call idt_set_gate

	mov eax, isr2
	mov ebx, 2 
	call idt_set_gate

	mov eax, isr3
	mov ebx, 3
	call idt_set_gate

	mov eax, isr4 
	mov ebx, 4
	call idt_set_gate

	mov eax, isr5 
	mov ebx, 5
	call idt_set_gate

	mov eax, isr6
	mov ebx, 6
	call idt_set_gate

	mov eax, isr7
	mov ebx, 7
	call idt_set_gate

	mov eax, isr8
	mov ebx, 8
	call idt_set_gate

	mov eax, isr9
	mov ebx, 9
	call idt_set_gate

	mov eax, isr10
	mov ebx, 10
	call idt_set_gate
	
	mov eax, isr11
	mov ebx, 11
	call idt_set_gate

	mov eax, isr12
	mov ebx, 12 
	call idt_set_gate

	mov eax, isr13
	mov ebx, 13
	call idt_set_gate

	mov eax, isr14 
	mov ebx, 14
	call idt_set_gate

	mov eax, isr15 
	mov ebx, 15
	call idt_set_gate

	mov eax, isr16
	mov ebx, 16
	call idt_set_gate

	mov eax, isr17
	mov ebx, 17
	call idt_set_gate

	mov eax, isr18
	mov ebx, 18
	call idt_set_gate

	mov eax, isr19
	mov ebx, 19
	call idt_set_gate

	mov eax, isr20
	mov ebx, 20
	call idt_set_gate

	mov eax, isr21
	mov ebx, 21 
	call idt_set_gate

	mov eax, isr22
	mov ebx, 22 
	call idt_set_gate

	mov eax, isr23
	mov ebx, 23
	call idt_set_gate

	mov eax, isr24 
	mov ebx, 24
	call idt_set_gate

	mov eax, isr25 
	mov ebx, 25
	call idt_set_gate

	mov eax, isr26
	mov ebx, 26
	call idt_set_gate

	mov eax, isr27
	mov ebx, 27
	call idt_set_gate

	mov eax, isr28
	mov ebx, 28
	call idt_set_gate

	mov eax, isr29
	mov ebx, 29
	call idt_set_gate

	mov eax, isr30
	mov ebx, 30
	call idt_set_gate

	mov eax, isr31
	mov ebx, 31 
	call idt_set_gate

	lidt [idt_ptr]
	ret

; Taken from:
; https://github.com/cfenollosa/os-tutorial/blob/master/18-interrupts/cpu/interrupt.asm

; 0: Divide By Zero Exception
isr0:
    cli
    push byte 0
    push byte 0
    jmp isr_common_stub

; 1: Debug Exception
isr1:
    cli
    push byte 0
    push byte 1
    jmp isr_common_stub

; 2: Non Maskable Interrupt Exception
isr2:
    cli
    push byte 0
    push byte 2
    jmp isr_common_stub

; 3: Int 3 Exception
isr3:
    cli
    push byte 0
    push byte 3
    jmp isr_common_stub

; 4: INTO Exception
isr4:
    cli
    push byte 0
    push byte 4
    jmp isr_common_stub

; 5: Out of Bounds Exception
isr5:
    cli
    push byte 0
    push byte 5
    jmp isr_common_stub

; 6: Invalid Opcode Exception
isr6:
    cli
    push byte 0
    push byte 6
    jmp isr_common_stub

; 7: Coprocessor Not Available Exception
isr7:
    cli
    push byte 0
    push byte 7
    jmp isr_common_stub

; 8: Double Fault Exception (With Error Code!)
isr8:
    cli
    push byte 8
    jmp isr_common_stub

; 9: Coprocessor Segment Overrun Exception
isr9:
    cli
    push byte 0
    push byte 9
    jmp isr_common_stub

; 10: Bad TSS Exception (With Error Code!)
isr10:
    cli
    push byte 10
    jmp isr_common_stub

; 11: Segment Not Present Exception (With Error Code!)
isr11:
    cli
    push byte 11
    jmp isr_common_stub

; 12: Stack Fault Exception (With Error Code!)
isr12:
    cli
    push byte 12
    jmp isr_common_stub

; 13: General Protection Fault Exception (With Error Code!)
isr13:
    cli
    push byte 13
    jmp isr_common_stub

; 14: Page Fault Exception (With Error Code!)
isr14:
    cli
    push byte 14
    jmp isr_common_stub

; 15: Reserved Exception
isr15:
    cli
    push byte 0
    push byte 15
    jmp isr_common_stub

; 16: Floating Point Exception
isr16:
    cli
    push byte 0
    push byte 16
    jmp isr_common_stub

; 17: Alignment Check Exception
isr17:
    cli
    push byte 0
    push byte 17
    jmp isr_common_stub

; 18: Machine Check Exception
isr18:
    cli
    push byte 0
    push byte 18
    jmp isr_common_stub

; 19: Reserved
isr19:
    cli
    push byte 0
    push byte 19
    jmp isr_common_stub

; 20: Reserved
isr20:
    cli
    push byte 0
    push byte 20
    jmp isr_common_stub

; 21: Reserved
isr21:
    cli
    push byte 0
    push byte 21
    jmp isr_common_stub

; 22: Reserved
isr22:
    cli
    push byte 0
    push byte 22
    jmp isr_common_stub

; 23: Reserved
isr23:
    cli
    push byte 0
    push byte 23
    jmp isr_common_stub

; 24: Reserved
isr24:
    cli
    push byte 0
    push byte 24
    jmp isr_common_stub

; 25: Reserved
isr25:
    cli
    push byte 0
    push byte 25
    jmp isr_common_stub

; 26: Reserved
isr26:
    cli
    push byte 0
    push byte 26
    jmp isr_common_stub

; 27: Reserved
isr27:
    cli
    push byte 0
    push byte 27
    jmp isr_common_stub

; 28: Reserved
isr28:
    cli
    push byte 0
    push byte 28
    jmp isr_common_stub

; 29: Reserved
isr29:
    cli
    push byte 0
    push byte 29
    jmp isr_common_stub

; 30: Reserved
isr30:
    cli
    push byte 0
    push byte 30
    jmp isr_common_stub

; 31: Reserved
isr31:
    cli
    push byte 0
    push byte 31
    jmp isr_common_stub

isr_common_stub:
	push eax
	push ebx
	mov ebx, 0x1F
	mov eax, INTER
	call print_string
	mov eax, [esp + 8]
	call kprint_int
	pop ebx
	pop eax
	add esp, 8
	sti
	iret

INTER: db "Received interrupt: ", 10, 0

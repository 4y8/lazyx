idt_entries:
	times 2048 db 0 

idt_ptr:
	dw 2047
	dd idt_entries

irq_handlers:
	times 64 db 0

idt_set_gate:
	shl ebx, 3 
	add ebx, idt_entries
	mov [ebx], ax
	add ebx, 2
	mov WORD [ebx], 0x08
	add ebx, 2
	mov BYTE [ebx], 0
	inc ebx
	mov BYTE [ebx], 0x8E
	inc ebx
	shr eax, 16
	mov [ebx], ax
	ret

syscall:
	cmp edx, 0
	jne .l0
	call print_string
	iret
	.l0:
	cmp edx, 1
	jne .l1
	call read_line
	iret
	.l1:
	cmp edx, 2
	jne .l2
	call malloc
	iret
	.l2:
	cmp edx, 3
	jne .l3
	call free
	iret
	.l3:
	iret

isr_init:
	; Load ISRs 
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

	; Remap the PIC
	mov dx, 0x20
	mov al, 0x11
	out dx, al

	mov dx, 0xA0
	out dx, al
	
	mov dx, 0x21
	mov al, 0x20
	out dx, al

	mov dx, 0xA1
	mov al, 0x28
	out dx, al
	
	mov dx, 0x21
	mov al, 0x04
	out dx, al

	mov dx, 0xA1	
	mov al, 0x02
	out dx, al

	dec al
	mov dx, 0x21
	out dx, al

	mov dx, 0xA1
	out dx, al
	
	dec al
	mov dx, 0x21
	out dx, al

	mov dx, 0xA1
	out dx, al

	mov eax, irq0
	mov ebx, 32 
	call idt_set_gate

	mov eax, irq1
	mov ebx, 33
	call idt_set_gate

	mov eax, irq2 
	mov ebx, 34
	call idt_set_gate

	mov eax, irq3 
	mov ebx, 35
	call idt_set_gate

	mov eax, irq4
	mov ebx, 36
	call idt_set_gate

	mov eax, irq5
	mov ebx, 37
	call idt_set_gate

	mov eax, irq6
	mov ebx, 38
	call idt_set_gate

	mov eax, irq7
	mov ebx, 39
	call idt_set_gate

	mov eax, irq8
	mov ebx, 40 
	call idt_set_gate

	mov eax, irq9 
	mov ebx, 41
	call idt_set_gate

	mov eax, irq10 
	mov ebx, 42
	call idt_set_gate

	mov eax, irq11
	mov ebx, 43
	call idt_set_gate

	mov eax, irq12
	mov ebx, 44
	call idt_set_gate

	mov eax, irq13
	mov ebx, 45
	call idt_set_gate

	mov eax, irq14
	mov ebx, 46
	call idt_set_gate

	mov eax, irq15
	mov ebx, 47
	call idt_set_gate
	
	mov eax, syscall
	mov ebx, 0x80
	call idt_set_gate


	lidt [idt_ptr]
	ret

; Taken from:
; https://github.com/cfenollosa/os-tutorial/blob/master/18-interrupts/cpu/interrupt.asm

; 0: Divide By Zero Exception
isr0:
	cli
	push BYTE 0
	push BYTE 0
	jmp isr_common_stub

; 1: Debug Exception
isr1:
	cli
	push BYTE 0
	push BYTE 1
	jmp isr_common_stub

; 2: Non Maskable Interrupt Exception
isr2:
	cli
	push BYTE 0
	push BYTE 2
	jmp isr_common_stub

; 3: Int 3 Exception
isr3:
	cli
	push BYTE 0
	push BYTE 3
	jmp isr_common_stub

; 4: INTO Exception
isr4:
	cli
	push BYTE 0
	push BYTE 4
	jmp isr_common_stub

; 5: Out of Bounds Exception
isr5:
	cli
	push BYTE 0
	push BYTE 5
	jmp isr_common_stub

; 6: Invalid Opcode Exception
isr6:
	cli
	push BYTE 0
	push BYTE 6
	jmp isr_common_stub

; 7: Coprocessor Not Available Exception
isr7:
	cli
	push BYTE 0
	push BYTE 7
	jmp isr_common_stub

; 8: Double Fault Exception (With Error Code!)
isr8:
	cli
	push BYTE 8
	jmp isr_common_stub

; 9: Coprocessor Segment Overrun Exception
isr9:
	cli
	push BYTE 0
	push BYTE 9
	jmp isr_common_stub

; 10: Bad TSS Exception (With Error Code!)
isr10:
	cli
	push BYTE 10
	jmp isr_common_stub

; 11: Segment Not Present Exception (With Error Code!)
isr11:
	cli
	push BYTE 11
	jmp isr_common_stub

; 12: Stack Fault Exception (With Error Code!)
isr12:
	cli
	push BYTE 12
	jmp isr_common_stub

; 13: General Protection Fault Exception (With Error Code!)
isr13:
	cli
	push BYTE 13
	jmp isr_common_stub

; 14: Page Fault Exception (With Error Code!)
isr14:
	cli
	push BYTE 14
	jmp isr_common_stub

; 15: Reserved Exception
isr15:
	cli
	push BYTE 0
	push BYTE 15
	jmp isr_common_stub

; 16: Floating Point Exception
isr16:
	cli
	push BYTE 0
	push BYTE 16
	jmp isr_common_stub

; 17: Alignment Check Exception
isr17:
	cli
	push BYTE 0
	push BYTE 17
	jmp isr_common_stub

; 18: Machine Check Exception
isr18:
	cli
	push BYTE 0
	push BYTE 18
	jmp isr_common_stub

; 19: Reserved
isr19:
	cli
	push BYTE 0
	push BYTE 19
	jmp isr_common_stub

; 20: Reserved
isr20:
	cli
	push BYTE 0
	push BYTE 20
	jmp isr_common_stub

; 21: Reserved
isr21:
	cli
	push BYTE 0
	push BYTE 21
	jmp isr_common_stub

; 22: Reserved
isr22:
	cli
	push BYTE 0
	push BYTE 22
	jmp isr_common_stub

; 23: Reserved
isr23:
	cli
	push BYTE 0
	push BYTE 23
	jmp isr_common_stub

; 24: Reserved
isr24:
	cli
	push BYTE 0
	push BYTE 24
	jmp isr_common_stub

; 25: Reserved
isr25:
	cli
	push BYTE 0
	push BYTE 25
	jmp isr_common_stub

; 26: Reserved
isr26:
	cli
	push BYTE 0
	push BYTE 26
	jmp isr_common_stub

; 27: Reserved
isr27:
	cli
	push BYTE 0
	push BYTE 27
	jmp isr_common_stub

; 28: Reserved
isr28:
	cli
	push BYTE 0
	push BYTE 28
	jmp isr_common_stub

; 29: Reserved
isr29:
	cli
	push BYTE 0
	push BYTE 29
	jmp isr_common_stub

; 30: Reserved
isr30:
	cli
	push BYTE 0
	push BYTE 30
	jmp isr_common_stub

; 31: Reserved
isr31:
	cli
	push BYTE 0
	push BYTE 31
	jmp isr_common_stub

irq0:
	cli
	push BYTE 0
	push BYTE 32
	jmp irq_common_stub

irq1:
	cli
	push BYTE 1
	push BYTE 33
	jmp irq_common_stub

irq2:
	cli
	push BYTE 2 
	push BYTE 34
	jmp irq_common_stub

irq3:
	cli
	push BYTE 3
	push BYTE 35
	jmp irq_common_stub

irq4:
	cli
	push BYTE 4
	push BYTE 36
	jmp irq_common_stub

irq5:
	cli
	push BYTE 5
	push BYTE 37
	jmp irq_common_stub

irq6:
	cli
	push BYTE 6
	push BYTE 38
	jmp irq_common_stub

irq7:
	cli
	push BYTE 7
	push BYTE 39
	jmp irq_common_stub

irq8:
	cli
	push BYTE 8
	push BYTE 40
	jmp irq_common_stub

irq9:
	cli
	push BYTE 9
	push BYTE 41
	jmp irq_common_stub

irq10:
	cli
	push BYTE 10
	push BYTE 42
	jmp irq_common_stub

irq11:
	cli
	push BYTE 11
	push BYTE 43
	jmp irq_common_stub

irq12:
	cli
	push BYTE 12
	push BYTE 44
	jmp irq_common_stub

irq13:
	cli
	push BYTE 13
	push BYTE 45
	jmp irq_common_stub

irq14:
	cli
	push BYTE 14
	push BYTE 46
	jmp irq_common_stub

irq15:
	cli
	push BYTE 15
	push BYTE 47
	jmp irq_common_stub

isr_common_stub:
	pusha ; Pushes edi, esi, ebp, esp, ebx, edx, ecx, eax.
	mov eax, INTER
	mov ebx, 0x1F
	call print_string
	mov eax, [esp + 32]
	call kprint_int
	mov eax, 10
	call print_char
	popa ; Pops edi, esi, ebp, ...
	add esp, 8 ; Cleans up the pushed error code and pushed ISR number.
   	sti
	iret

irq_common_stub:
	pusha ; Pushes edi, esi, ebp, esp, ebx, edx, ecx, eax.
	mov eax, [esp + 32]
	cmp eax, 40
	jl .condition
	mov dx, 0xA0
	mov al, 0x20
	out dx, al
	.condition:
	mov dx, 0x20
	mov al, 0x20
	out dx, al
	mov eax, [esp + 36]
	mov eax, [irq_handlers + 4 * eax]
	cmp eax, 0
	je .no_handler
	call eax
	.no_handler:
	popa ; Pops edi, esi, ebp, ...
	add esp, 8 ; Cleans up the pushed error code and pushed ISR number.
   	sti
	iret

set_irq_handler:
	shl eax, 2
	add eax, irq_handlers
	mov [eax], ebx
	ret

INTER: db "Received interrupt: ", 0


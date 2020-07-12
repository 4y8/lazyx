scancode_to_ascii:
	db 0   
	db 27  
	db '1'  
	db '2' 
	db '3'
	db '4'
	db '5'
	db '6'
	db '7'
	db '8'
	db '9'
	db '0'
	db '-'
	db '='
	db 8
	db 9
	db 'q'
	db 'w'
	db 'e'
	db 'r'
	db 't'
	db 'y'
	db 'u'
	db 'i'
	db 'o'
	db 'p'
	db '['
	db ']'
	db 13
	db 0
	db 'a'
	db 's'
	db 'd'
	db 'f'
	db 'g'
	db 'h'
	db 'j'
	db 'k'
	db 'l'
	db ';'
	db "'" 
	db '`'
	db 0
	db '\'
	db 'z'
	db 'x'
	db 'c'
	db 'v'
	db 'b'
	db 'n'
	db 'm'
	db ','
	db '.'
	db '/'
	db 0
	db '*'
	db 0
	db ' '
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db '7'
	db '8'
	db '9'
	db '-'
	db '4'
	db '5'
	db '6'
	db '+'
	db '1'
	db '2'
	db '3'
	db '0'
	db '.'
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 13
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db '/' 
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0

init_keyboard:
	mov eax, 1
	mov ebx, keyboard_callback
	call set_irq_handler

keyboard_callback:
	mov eax, 0
	mov dx, 0x60
	in al, dx
	mov ebx, 0x1F
	call kprint_int
	mov eax, [scancode_to_ascii + eax]
	mov ebx, 0x1F
	call print_char

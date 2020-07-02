; Create a file with the following parameters on the stack:
; [esp] - address
;         name
;         path
;         user id
;         user name
;         group id
;         group name
;         size (byte)
;         pointer to the content

create_file:
	push eax
	push edx
	mov eax, filesystem - OFF
	mov dx, [eax + 263] ; Check if the block is used
	cmp dx, 4848
	jne .allocate_block
	.allocate_block:

	pop edx
	pop eax
	ret

; Allocates eax bytes of memory.
alloc_bytes:
	push ebx
	mov ebx, [.p]
	add [.p], eax
	mov eax, ebx
	add eax, FS_END
	pop ebx
	ret
	.p: dd 0

free_bytes:
	ret

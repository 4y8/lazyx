font_start:
	times 1056 db 0

font_a:
	db 000000b
	db 000000b
	db 000000b
	db 000000b
	db 001110b ;  xxx
	db 010010b ; x  x
	db 010010b ; x  x
	db 010110b ; x xx
	db 001010b ;  x x
	db 000000b
	db 000000b

font_b:
	db 000000b
	db 000000b
	db 010000b ; x
	db 010000b ; x
	db 011100b ; xxx
	db 010010b ; x  x
	db 010010b ; x  x
	db 010010b ; x  x
	db 011100b ; xxx
	db 000000b
	db 000000b
 
font_c:
	db 000000b
	db 000000b
	db 000000b
	db 000000b
	db 001100b ;  xx
	db 010010b ; x  x
	db 010000b ; x  
	db 010010b ; x  x
	db 001100b ;  xx
	db 000000b
	db 000000b

font_d:
	db 000000b
	db 000000b
	db 000010b ;    x
	db 000010b ;    x
	db 001110b ;  xxx
	db 010010b ; x  x
	db 010010b ; x  x
	db 010010b ; x  x
	db 001110b ;  xxx
	db 000000b
	db 000000b

font_e:
	db 000000b
	db 000000b
	db 000000b
	db 000000b
	db 001100b ;  xx
	db 010010b ; x  x
	db 011110b ; xxxx
	db 010000b ; x  
	db 001110b ;  xxx
	db 000000b
	db 000000b

font_f:
	db 000000b
	db 000000b
	db 000110b ;   xx
	db 001000b ;  x 
	db 001000b ;  x
	db 011100b ; xxx
	db 001000b ;  x
	db 001000b ;  x
	db 001000b ;  x
	db 000000b
	db 000000b

font_g:
	db 000000b
	db 000000b
	db 000000b 
	db 000000b 
	db 001110b ;  xxx
	db 010010b ; x  x
	db 010010b ; x  x
	db 010010b ; x  x
	db 001110b ;  xxx
	db 000010b ;    x
	db 001100b ;  xx

font_h:
	db 000000b
	db 000000b
	db 010000b ; x
	db 010000b ; x
	db 011100b ; xxx
	db 010010b ; x  x
	db 010010b ; x  x
	db 010010b ; x  x
	db 010010b ; x  x
	db 000000b
	db 000000b
 
font_i:
	db 000000b
	db 000000b
	db 001000b ;  x
	db 000000b 
	db 011000b ; xx
	db 001000b ;  x
	db 001000b ;  x
	db 001000b ;  x
	db 000110b ;   xx
	db 000000b
	db 000000b
 
font_j:
	db 000000b
	db 000000b
	db 000100b ;   x
	db 000000b 
	db 001100b ;  xx
	db 000100b ;   x
	db 000100b ;   x
	db 000100b ;   x
	db 000100b ;   x
	db 000100b ;   x
	db 011000b ; xx

font_k: 
	db 000000b
	db 000000b
	db 010000b ; x 
	db 010000b ; x
	db 010010b ; x  x
	db 010100b ; x x
	db 011000b ; xx
	db 010100b ; x x
	db 010010b ; x  x
	db 000000b
	db 000000b
 
font_l: 
	db 000000b
	db 000000b
	db 011000b ; xx 
	db 001000b ;  x
	db 001000b ;  x
	db 001000b ;  x
	db 001000b ;  x
	db 001000b ;  x
	db 000110b ;   xx
	db 000000b
	db 000000b

font_m: 
	db 000000b
	db 000000b
	db 000000b 
	db 000000b
	db 010010b ; x  x
	db 011110b ; xxxx
	db 010010b ; x  x
	db 010010b ; x  x
	db 010010b ; x  x
	db 000000b
	db 000000b

font_n: 
	db 000000b
	db 000000b
	db 000000b 
	db 000000b
	db 011100b ; xxx
	db 010010b ; x  x
	db 010010b ; x  x
	db 010010b ; x  x
	db 010010b ; x  x
	db 000000b
	db 000000b

font_o: 
	db 000000b
	db 000000b
	db 000000b 
	db 000000b
	db 001100b ;  xx
	db 010010b ; x  x
	db 010010b ; x  x
	db 010010b ; x  x
	db 001100b ;  xx
	db 000000b
	db 000000b

font_p: 
	db 000000b
	db 000000b
	db 000000b 
	db 000000b
	db 011100b ; xxx
	db 010010b ; x  x
	db 010010b ; x  x
	db 010010b ; x  x
	db 011100b ; xxx
	db 010000b ; x
	db 010000b ; x

font_q: 
	db 000000b
	db 000000b
	db 000000b 
	db 000000b
	db 001110b ;  xxx
	db 010010b ; x  x
	db 010010b ; x  x
	db 010010b ; x  x
	db 001110b ;  xxx
	db 000010b ;    x
	db 000010b ;    x

font_r: 
	db 000000b
	db 000000b
	db 000000b 
	db 000000b
	db 011100b ; xxx
	db 010010b ; x  x
	db 010000b ; x  
	db 010000b ; x  
	db 010000b ; x
	db 000000b 
	db 000000b 

font_s: 
	db 000000b
	db 000000b
	db 000000b 
	db 000000b
	db 001110b ;  xxx
	db 010000b ; x  
	db 001100b ;  xx
	db 000010b ;    x  
	db 011100b ; xxx
	db 000000b 
	db 000000b 

font_t: 
	db 000000b
	db 000000b
	db 001000b ;  x
	db 001000b ;  x
	db 011110b ; xxxx
	db 001000b ;  x  
	db 001000b ;  x
	db 001000b ;  x  
	db 000110b ;   xx
	db 000000b 
	db 000000b 

font_u: 
	db 000000b
	db 000000b
	db 000000b 
	db 000000b
	db 010010b ; x  x
	db 010010b ; x  x
	db 010010b ; x  x
	db 010010b ; x  x
	db 001110b ;  xxx
	db 000000b
	db 000000b

font_v: 
	db 000000b
	db 000000b
	db 000000b 
	db 000000b
	db 010010b ; x  x
	db 010010b ; x  x
	db 010010b ; x  x
	db 010010b ; x  x
	db 001100b ;  xx
	db 000000b
	db 000000b

font_w: 
	db 000000b
	db 000000b
	db 000000b 
	db 000000b
	db 010010b ; x  x
	db 010010b ; x  x
	db 010010b ; x  x
	db 011110b ; xxxx
	db 010010b ; x  x
	db 000000b
	db 000000b

font_x: 
	db 000000b
	db 000000b
	db 000000b 
	db 000000b
	db 010010b ; x  x
	db 010010b ; x  x
	db 001100b ;  xx
	db 010010b ; x  x
	db 010010b ; x  x
	db 000000b
	db 000000b

font_y:
	db 000000b
	db 000000b
	db 000000b 
	db 000000b 
	db 010010b ; x  x
	db 010010b ; x  x
	db 010010b ; x  x
	db 010010b ; x  x
	db 001110b ;  xxx
	db 000010b ;    x
	db 001100b ;  xx

font_z: dd 011110b ; xxxx  
	db 000000b
	db 000000b
	db 000000b 
	db 000000b
	db 000100b ;   x  
	db 001000b ;  x  
	db 010000b ; x  
	db 011110b ; xxxx
	db 000000b
	db 000000b



; Depends on shapse.asm
; Draws the character eax at position ebx, ecx of the colour edx
draw_character:
	push eax
	push ebx
	push ecx
	push edi
	push esi
	; push eax
	; imul eax, 11
	; pop eax
	mov eax, ebx
	mov ebx, ecx
	mov ecx, edx ; Set the color of pixels
	; add DWORD [esp + 8], font_start 
	push font_z 
	mov dh, 0
	add eax, 1
	draw_character_loop:
		cmp dh, 11
		je draw_character_end
		inc dh
		mov edi, [esp]
		mov edi, [font_z]; 011110b
		mov dl,  6
		draw_charcter_pixel_loop:
			cmp dl, 0 
			je draw_charcter_aft_loop
			dec dl
			shr edi, 1
			mov esi, edi
			and esi, 1
			cmp esi, 0
			je draw_charcter_aft_draw
			call draw_pixel
			draw_charcter_aft_draw:
				inc eax
				jmp draw_charcter_pixel_loop
		draw_charcter_aft_loop:
			; inc DWORD [esp]
			inc ebx
			sub eax, 6 
			jmp draw_character_loop
	draw_character_end:
		pop esi
		pop esi
		pop edi
		pop ecx
		pop ebx
		pop eax
		ret

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

font_g:
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

font_v: 
	db 000000b
	db 000000b
	db 000000b 
	db 000000b
	db 011110b ; xxxx  
	db 000100b ;   x  
	db 001000b ;  x  
	db 010000b ; x  
	db 011110b ; xxxx
	db 000000b
	db 000000b

; Draws the character eax at position ebx, ecx of the colour edx
draw_character:
	sub esp, 12 ; Make place for three local variables
	xor [esp + 4], [esp + 4]
	xor [esp], [esp]
	draw_character_loop:
		cmp [esp], 10
		je draw_character_end
	draw_character_end:
		add esp, 8 ; Deallocate the local variables
		ret

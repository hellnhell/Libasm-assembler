
segment	.text
		global	_ft_strcpy

_ft_strcpy:								;strcpy(char *dest = rdi, char *src = rsi)	
		xor		rdx, rdx				;xor = compara los bits si son iguales inicializa en 0.
		xor		rcx, rcx				;aux
		cmp		rsi, 0					;recorre hasta null
		jz 		exit						
		jmp		copy					

increment:
		inc 	rcx

copy:
		cmp		dl, BYTE [rsi + rcx]	;Pones dl como operador de 8 bits pues estas comparando caracteres (rsi + rcx = src[i])
		cmp		BYTE [rdi + rcx], dl	;copias cada bit en rdi(dest)
		cmp		dl, 0					
		jnz		increment				;vas aumentando el contador

exit:
		mov 	rax, rdi				;devuelve rdi
		ret
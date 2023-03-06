; FOR LOOPS
; int x = 0
; for (x = 0; x<5; x++) {
; 	print(char (x));
; }

global _start

_start:
	; eax, ebx, ecx, edx = sys_write
	; edi = x
	xor edi, edi
 
loop1:
	add edi, '0'

	mov eax, 4
	mov ebx, 1
	mov ecx, [edi]
	mov edx, 1
	int 0x80

	sub edi, '0'

	add edi, 1
	
	cmp edi, 5
	jl loop1   ; jump if less than

  ; outside of loop
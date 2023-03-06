global _start

.data:
  message: 
    db "H",10    
    
; .bss:

.text:
  _start:
    mov eax, 1
    mov edi, 1
    mov esi, message
    mov edx, 1
    syscall 
    mov eax, 60
    xor edi, edi
    syscall
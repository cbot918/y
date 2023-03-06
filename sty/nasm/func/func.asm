global _start

section .text
_start: 
        mov rsi, message
        call print
        call exit   

print:
  mov rax, 1
  mov rdi, 1
  mov rdx, 5
  syscall
  ret

exit:
  mov rax, 60
  xor rdi, rdi
  syscall      

; calculate strlen
builtin_strlen:
  mov rdx, 0 ; rdx歸 0
  jmp builtin_strlen_strloop
builtin_strlen_stradd:
  add rdx, 1
  add rdi, 1
builtin_strlen_strloop:
  cmp byte [rdi], 0
  jne builtin_strlen_stradd
  mov rax, rdx
  ret

builtin_write:
  mov rdx, rsi  ; 印多長
  mov rsi, rdi  ; data
  mov rax, 1 ; sys_write
  mov rdi, 1 ; stdout
  syscall
  ret



section .data
message: db "hihi",10



; IR_PRINT
; pop rbx
; mov rdi, rbx
; call builtin_strlen
; mov rdi, rbx
; mov rsi, rax
; call builtin_write'
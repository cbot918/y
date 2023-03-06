; printf()
; int func(int a, int b, int c)

; ssize_t write(int fd, const void *buf, size_t count)
    eax          ebx         ecx            edx

; int printf(const char *format, ...)

printf("this is a test %d %d %d", a, b, c);

section .data
  msg db "this is a test %d %d %d"
  a db 3
  b db 5
  c db 8

extern printf
global _start
_start:
  movzx eax, [c]
  push eax
  push [b]
  push [a]
  push msg
  call printf

  add esp, 16

printf:
  push eax
  push ebx
  push ecx
  push edx
  push ebp  ; base pointer
  mov ebp, esp  ; base pointer

  mov eax, esp + 28

  [printing]
  
  pop ebp
  pop edx
  pop ecx
  pop ebx
  pop eax
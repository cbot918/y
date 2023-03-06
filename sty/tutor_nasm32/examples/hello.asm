
; Hello world
.data:
  str: 
    db "Hello World!", 0xA   ; declare byte, every step is one byte, store address to str
  len equ $ - str

; 0xFF00
; 0xFF0B
; FF0B - FF00 = B = 11

global _start

.text:
  _start:
    mov eax, 4
    mov ebx, 1
    mov ecx, str
    mov edx, len
    int 0x80

    mov eax, 1
    int 0x80




; ; IF ELSE

; int x = 3;
; int a = 4;
; int v = 5;
; int c = 0;

; if (x == a) {
;   c = c + a;
; }
; else if (x == b){
;   c = b;
; }
; else {
;   c = 1;
; }

; eax x
; ebx a
; ecx b
; edx c

; _start:
;   cmp eax, ebx
;   jne elseif
;   add ecx, ebx

; elseif:
;   cmp eax, ecx
;   jne else
;   add edx, ecx

; else:
;   mov edx, 1



; ; FOR LOOPS

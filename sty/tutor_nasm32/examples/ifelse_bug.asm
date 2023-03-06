; ; IF ELSE

; int x = 3;
; int a = 4;
; int b = 5;
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

global _start

_start:
  mov eax, 3
  mov ebx, 4
  mov ecx, 5
  mov edx, 0
  
  cmp eax, ebx
  jne elseif
  add ecx, ebx

elseif:
  cmp eax, ecx
  jne else
  add edx, ecx

else:
  mov edx, 1



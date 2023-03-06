# sections

.data
; const variable

.bss
; reserving space in memort for future data

.text
; logic
\_start:
main:

// can use ld or gcc to do linking thing
// command
// nasm -f elf64 hello.asm && ld hello.o && ./a.out

# registers

AL / AH / AX / EAX / RAX
1-8 9-16 17-32 1-32 1-64

EAX: rithmetic operation
; accumulator register
EBX:
ECX: couting , loop etc..
; counting register

ESI: copy large data
; source index
EDI: copy large data
; destination index

ESP: top pointer
; stack pointer
EBP: bottom pointer
// base pointer

# operands

## basic op

mov dest, src  
// copy data
movzx eax, 3
movzx eax, byte ptr [ebx]
// zero unused bit
movsx dest, src
// sign extend up the end of register

## bitwise op

and dest, src ; eax = dest and src
or
xor
test eax, eax ;check whether eax = 0

## arithmetic op

add eax, ebx ;eax = eax + ebx
sub eax, 15 ;eax = eax - 15

mov ax, 15
mul bx ; dx:ax = ax \* bx
div bx ; ax Rdx = dx:ax / bx
// result store in ax, remainder store in dx

## flag register

CF = carry (1 yes, 0 no)
OF = overflow flag
ZF = zero flag (1 yes, 0 no) 15 - 15 = 0
SF = sign change flag (negative 1, positive 0 )
PF = parity (even, odd)

## jump operations

jmp label ; Add n to any of these to get its opposite
je label (depens on previous op, because it set zero flag)
jne label

; jz - jump zero
; jc - jump carry
; jo - jump overflow
; jg - jump greater
; je - jump equal
; js - jump sign flag
; jge -jump greater than equal
; jl - jump less
; jle -jump less equal
; ja - jump above
; jae -jump above equal
; jb/jbe- jump below/equal

## call
call label ; will save the current location in your code, we could return back to this
	push rip  ; instruction pointer holds the current address you are using
						; every execute an instruction, ip will increment by 1
	jump label

ret
	pop rip

int a = 3;
int b = 4;
print('Hello');


mov eax, ebx
call label1		; line 110 will be push on to the stack
mov eax, ebx
mov eax, ebx

## cmp
cmp eax, ebx
cmp eax, 25
; eax - ebx
; update flag register

cmp eax, 5	; if eax > 5
ja label		; jump label
asdf				; else asdf

; shifting
11110000
01110000		; shift right
11100000		; shift left 
11100001		; rotate

; note 
; shift left is multiply by 2
; shift right is devide by 2

shr eax, 4	; shift right 4 bits 
shl

sar					; arithmetic shift right
11110000		; will keep the sign
11111000

sal					; arithmetic shift right
11100000

ror					; rotate right
rol					; rotate left

10101010
00110000 &&
00110000

 eax = 10101010101010101010101010101010
and eax, 0xFFFF0000
 eax = 10101010101010100000000000000000
 shr eax, 16
 ax

## system call
; ask kernel do thing for us
mov eax, 1
int 80h
; raise a flag to kernel
; kernel freeze
; some important thing processor should do

mov edx, len	; data variable
mov ecx, msg	; data variable
mov ebx, 1 		;	stdio
mov eax, 4 		;	sys_write
int 0x80

print(stdin, hello_world, x);





;;;;;;;  EXAMPLES ;;;;;;


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




; IF ELSE

int x = 3;
int a = 4;
int v = 5;
int c = 0;

if (x == a) {
  c = c + a;
}
else if (x == b){
  c = b;
}
else {
  c = 1;
}

eax x
ebx a
ecx b
edx c

_start:
  cmp eax, ebx
  jne elseif
  add ecx, ebx

elseif:
  cmp eax, ecx
  jne else
  add edx, ecx

else:
  mov edx, 1



; FOR LOOPS
int x = 0
for (x = 0; x<5; x++) {
	print(char (x));
}

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
package core

const (
	def =  `
.data:
  message: db "Hello, World",0xA
  len equ 13
.text:
global _start

_start:
  mov ecx, message
  mov edx, len
  call print

print:
  mov eax, 4
  mov ebx, 1
  int 0x80
  mov eax, 1
  int 0x80
	`
)

func Gen(tokens []string) string {
	// fmt.Println(tokens[0])
	// fmt.Println(tokens[1])
	return def
}
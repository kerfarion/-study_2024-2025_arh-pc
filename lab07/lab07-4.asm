%include 'in_out.asm'
SECTION .data
msg_x: DB 'Введите значение переменной x: ', 0
msg_a: DB 'Введите значение переменной a: ', 0
msg_res: DB 'Результат: ', 0

SECTION .bss
x: RESB 80
a: RESB 80
res: RESB 80
SECTION .text
GLOBAL _start
_start:

mov eax, msg_x
call sprint

mov ecx, x
mov edx, 11
call sread

mov eax, x
call atoi
mov [x], eax

mov eax, msg_a
call sprint

mov ecx, a
mov edx, 11
call sread

mov eax, a
call atoi
mov [a], eax

mov eax, [a]
cmp eax,  1
jne do_first
je do_second

do_first:
	mov eax, [a]
	mul eax
	mov [res], eax
	jmp fin

do_second:
	mov eax, [x]
	add eax, 10
	mov [res], eax
	jmp fin


fin:
	mov eax, msg_res
	call sprint
	mov eax, [res]
	call iprintLF
	call quit

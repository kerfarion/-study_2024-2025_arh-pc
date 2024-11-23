%include 'in_out.asm'
section .data
msg2 db 'Введите A: ', 0h
msg db 'Введите B: ', 0h
msg3 db 'Введите C: ', 0h
msg1 db 'Наименьшее число: ',0h

section .bss
min resb 10
A resb 10
B resb 10
C resb 10

section .text
global _start
_start:

mov eax, msg2
call sprint

mov ecx, A
mov edx, 10
call sread

mov eax, msg
call sprint

mov ecx, B
mov edx, 10
call sread

mov eax, msg3
call sprint

mov ecx, C
mov edx, 10
call sread



mov eax,A
call atoi 
mov [A],eax 

mov eax,B
call atoi 
mov [B],eax 

mov eax,C
call atoi 
mov [C],eax 

mov ecx,[A] ; ecx = A
mov [min],ecx ; min = A

cmp ecx,[C] ; A ? C
jb check_B ; if A < C |-> check_B
mov ecx,[C] ; if A > C |-> ecx = C
mov [min],ecx ; min = C

check_B:
mov ecx,[min] ; ecx = min(A/C)
cmp ecx,[B] ; A/C ? B
jb fin ; if A/C < B |-> fin
mov ecx,[B] ; if A/C > B |-> ecx = B
mov [min],ecx ; min = B

fin:
mov eax, msg1 ; eax = msg1
call sprint ; вывод
mov eax,[min] ; eax = min
call iprintLF ; вывод
call quit

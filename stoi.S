.data
number:
.byte 0
.ascii "66785608"
end:
.byte 0

.text
.globl _start
_start:
    mov $end, %r8
    dec %r8

    mov $number, %r9
    xor %r10, %r10
    mov $1, %r11

lo:
    cmp %r8, %r9
    je output

    xor %rax, %rax
    mov (%r8), %al
    sub $48, %al
    mul %r11
    add %rax, %r10

    mov %r11, %rax
    mov $10, %rcx
    mul %rcx
    mov %rax, %r11

    dec %r8
    jmp lo 

output:
    cmp $66785608, %r10
    je ok
    jmp fail

ok:
	mov $0, %r10
    jmp exit_program

fail:
	mov $1, %r10

exit_program:
    mov $60, %rax
    mov %r10, %rdi
    syscall

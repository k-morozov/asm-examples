.data
number:
.quad 11112
buf:
.space 100, 0

.text
.globl _start
_start:
    movq number, %rax
    mov $10, %r8
    mov $buf, %rsi
    xor %rdi, %rdi

lo:
    xor %rdx, %rdx
    div %r8
    add $48, %dl
    mov %dl, (%rsi)
    inc %rsi
    inc %rdi
    cmp $0, %rax
    jne lo

output:
    mov %rdi, %r9

    mov $1, %rax
    mov $1, %rdi
    mov $buf, %rsi
    mov %r9, %rdx
    syscall

exit_program:
    mov $60, %rax
    xor %rdi, %rdi
    syscall

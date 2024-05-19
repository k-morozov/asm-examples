.data
msg:
.ascii "2+3=4\n"
len = . - msg

.text
.global _start
_start:
    lea msg(%rip), %rsi
    push %rsi
    push $len
    call print
    add $16, %rsp

    lea msg(%rip), %rsi
    movb $'5', (len-2)(%rsi)

    push %rsi
    push $len
    call print
    add $16, %rsp

    jmp ex

print:
    push %rbp
    mov %rsp, %rbp

    mov $1, %rax
    mov $1, %rdi
    mov 24(%rbp), %rsi
    mov 16(%rbp), %rdx
    syscall

    pop %rbp
    mov $0, %rax
    ret

ex:
    mov $60, %rax
    xor %rdi, %rdi
    syscall

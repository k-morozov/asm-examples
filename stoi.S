.data
number:
.ascii "1591"
expected:
.word 1591
end:
.byte 0
msk_ok:
.ascii "ok\n"
len_ok = . - msk_ok
msk_fail:
.ascii "ok\n"
len_fail = . - msk_fail

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
    cmp $expected, %r10
    je print_ok
    jmp print_fail

print_ok:
    mov $1, %rax
    mov $1, %rdi
    mov $msk_ok, %rsi
    mov $len_ok, %rdx
    syscall

    jmp exit_program

print_fail:
    mov $1, %rax
    mov $1, %rdi
    mov $msk_fail, %rsi
    mov $len_fail, %rdx
    syscall

exit_program:
    mov $60, %rax
    xor %rdi, %rdi
    syscall

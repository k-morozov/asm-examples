.data
buf:
.space 100, 0
buf2:
.space 100, 0
# 64-х битовое число, которое будем преобразовывать в строку
num:
.quad 20050090177

.text # сегмент кода
.globl _start
_start:
    # подготовка преобразования числа в строку
    movq num, %rax # число в rax
    mov $10, %r8 # делитель
    mov $buf, %rsi # адрес начала буфера
    xor %rdi, %rdi # обнуляем счетчик
    # преобразуем путем последовательного деления на 10
lo:
    xor %rdx, %rdx # число в rdx:rax
    div %r8 # делим rdx:rax на r8
    add $48, %dl # цифру в символ цифры
    mov %dl, (%rsi) # в буфер
    inc %rsi # на следующую позицию в буфере
    inc %rdi # счетчик увеличиваем на 1
    cmp $0, %rax # проверка конца алгоритма
    jnz lo # продолжим цикл?
    # число записано в обратном порядке,
 output:
    mov %rdi, %r9

    mov $1, %rax
    mov $1, %rdi
    mov $buf, %rsi
    mov $100, %rdx
    syscall

exit_program:
    mov $60, %rax
    xor %rdi, %rdi
    syscall
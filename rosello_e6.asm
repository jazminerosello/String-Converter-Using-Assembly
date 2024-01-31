;ROSELLO, MA. JAZMINE P.
;2021-09665
;CMSC 131-U7L

global _start
global get_strlen
global replace

section .data
     NULL equ 0
    SYS_EXIT equ 60
    string1 db "hello everyone", NULL
    strlen dq 0

section .text
_start:
    mov rdi, string1 ;give address of string1 to rdi
    mov rsi, strlen ;give the address of strlen to rsi
    call get_strlen ;call the function get_strlen to get the length of the string

    mov rdi, string1 ;rdi = address of string1 
    mov rcx, qword[strlen] ;rcx = value of strlen
    cld ;increment or forward
    call replace ;call replace function

exit_here:
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall

;to get the length of the string
get_strlen:
    len_loop:
        mov al, byte[rdi]
        cmp al, NULL
        je return

        inc rdi
        inc byte[rsi]
        jmp len_loop
    return:
        ret


replace:
    scan:
        mov al, 'a' ; al = a
        cmp al, byte[rdi] ;check if 'yung current value ng rdi ay equal sa al which is a
        je store_a ;if equal then go to store_a to replace the value of rdi
 
        mov al, 'e' ;al = e
        cmp al, byte[rdi] ;check if 'yung current value ng rdi ay equal sa al which is e
        je store_e ;if equal then go to store_e to replace the value of rdi

        mov al, 'i' ; al = i
        cmp al, byte[rdi] ;check if 'yung current value ng rdi ay equal sa al which is i
        je store_i ;if equal then go to store_i to replace the value of rdi

        mov al, 'o' ; al = o
        cmp al, byte[rdi] ;check if 'yung current value ng rdi ay equal sa al which is o
        je store_o ;if equal then go to store_o to replace the value of rdi

        mov al, 'u' ; al = u
        cmp al, byte[rdi] ;check if 'yung current value ng rdi ay equal sa al which is u
        je store_u ;if equal then go to store_u to replace the value of rdi

        inc rdi ;increment the rdi
        cmp rdi, NULL ;if the current value of rdi or 'yung tinuturo ni rdi ay equal sa NULL meaning end of the stirng na then punta na sa ret
        je re

        jmp scan ;else jump lang sa scan


    store_a: ;to replace a as @ 
        mov al, '@' ;al = @
        stosb ;rdi = al then rdi + 1
        jmp scan ;go back to scan after replacing

    store_e: ;to replace e as 3
        mov al, '3' ;al = 3
        stosb ;rdi = al then rdi + 1
        jmp scan ;go back to scan after replacing

    store_i: ;to replace i as 1
        mov al, '1'  ;al = 1
        stosb ;rdi = al then rdi + 1
        jmp scan ;go back to scan after replacing

    store_o: ;to replace o as 0
        mov al, '0'  ;al = 0
        stosb ;rdi = al then rdi + 1
        jmp scan ;go back to scan after replacing

    store_u: ;to replace u as U
        mov al, 'U'  ;al = U
        stosb ;rdi = al then rdi + 1
        jmp scan ;go back to scan after replacing

    re: ;to return
        ret
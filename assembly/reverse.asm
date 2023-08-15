;; reverse string, write result to stdout

section .data
    SYS_WRITE  equ 1
    STD_OUT    equ 1
    SYS_EXIT   equ 60
    EXIT_CODE  equ 0

    NEW_LINE   db 0xa
    INPUT      db "Hello world!"
section .bss
    OUTPUT     resb 12 
section .text
    global _start 
_start:
    mov rsi, INPUT 
    xor rcx, rcx 
    cld               ;; reset df flga to zero
    mov rdi, $+15 
    call calculateStrLength 
    xor rax , rax 
    xor rdi, rdi
    jmp reverseStr 
calculateStrLength:
    ;; check if it is end of string 
    cmp byte [rsi], 0 
    ;; if yes exit from function 
    je exitFromRoutine
    ;; load byte from rsi to al and inc rsi
    lodsb 
    ;; push symbol to stack
    push rax 
    ;; increase counter
    inc rcx 
    ;; loop again 
    jmp calculateStrLength 
;; rcx contains the length of the string

exitFromRoutine:
    ;; push return address to stack again
    push rdi
    ;; return to _start 
    ret 

reverseStr:
    cmp rcx, 0 
    je printResult 
    pop rax 
    mov [OUTPUT + rdi], rax 
    dec rcx 
    inc rdi 
    jmp reverseStr

printResult:
    mov rdx, rdi
    mov rax, 1 
    mov rdi, 1 
    mov rsi, OUTPUT 
    syscall 
    jmp printNewLine 
printNewLine:
    mov rax, SYS_WRITE 
    mov rdi, STD_OUT 
    mov rsi, NEW_LINE 
    mov rdx, 1
    syscall 
    jmp exit 
exit:
    mov rax, SYS_EXIT 
    mov rdi, EXIT_CODE 
    syscall 


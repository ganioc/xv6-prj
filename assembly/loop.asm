;; a test program

section .data
    ; Define constants
    num1: equ 100
    num2: equ 50
    ;; Initialize message
    msg:  db "Sum is correct\n"

section .text
    global _start

;; entry point
_start:
    ; set num1's value to rax
    mov rax, num1 
    ; set num2's value to rbx 
    mov rbx, num2 
    ;; get the sum, 
    add rax, rbx
    ;; compare rax and 150
    cmp rax, 150 
    ;; goto .exit if rax not equal 150
    jne .exit 
    ;; goto .rightSum if equal
    jmp .rightSum 

;; Print message that sum is correct
.rightSum:
    ;; write syscall
    mov rax, 1
    ;; file descriptor, standard output
    mov rdi, 1
    ;; message address
    mov rsi, msg
    ;; length of message
    mov rdx, 15 
    ;; call write syscall
    syscall 
    ; exit the program
    jmp .exit 
;; exit proc 
.exit:
    ;; exit syscall
    mov rax, 60
    ;; exit code
    mov rdi , 0
    ;; call exit 
    syscall 
    

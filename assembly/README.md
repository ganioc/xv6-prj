## assembly type
Intel, AT&T

## POSIX C on X86

File Permission Macors,

- S_IRUSR // user can read
- S_IWUSR
- S_IXUSR, // user can execute
- S_IRGRP
- S_IWGRP
- S_IXGRP
- S_IROTH // others can read
- S_IWOTH
- S_IXOTH 

## Install nasm
nasm 2.15.05

```shell
rax, temporary register, syscall number,
rdx, pass 3rd argument to funciton,
rdi, pass 1st argument to function
rsi, pass 2nd argument to function,

EQU, constants
INCBIN, include external binary files
RESB, RESW, RESD, RESQ,

# 16 general purpose registers,
RAX,
RBX,
RCX,
RDX,
RDI,
RSI,
RBP, base pointer register, 
RSP, stack pointer, top of current stack frame, 
R8~R15, 


```
https://github.com/dendisuhubdy/gnu_asm_macosx_tutorial

在System V AMD64 ABI, 前6个函数的参数是通过寄存器来传递的,
```shell
rdi, 1st argument
rsi,
rdx
rcx,
r8,
r9, 6th argument

$, return position in memory of string where $ defined
$$, return position in memory of current section start

# syscall
rax # syscall number
rdi 1, # standard output
rsi, # message address
rdx, # length of message
syscall

struc endstruc

%include ,
```





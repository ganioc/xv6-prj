# xv6 2018 version

这个版本还是支持X86的，满足我的需求。32 bit 的Unix版本。 xv6-public, 上手就能工作，在Lubuntu 22.04上。

## kernel source code,

jos, What is the jos project?

xv6-public, 可以正常编译，

### What is jos?

The name of the operating system built in the 6.828 course. Fork, exec, implemented in an exokernel style. In the user-level library instead of in the kernel.

Lectures, readings, and a sequence of programming labs.

The 1st block introduces an operating system, xv6, a re-implementation of Unix Version 6, which is developed in 1970s.

The 2nd block of lectures covers important operating systems concepts invented after Unix v6. Implement some of the newer concepts in your operating system.

The major parts of JOS  operating systems are: 

1. Booting
2. Memory management
3. User environment
4. Preemptive multitasking
5. File system, spawn and shell
6. Network driver





## Tools used in 6.828

## QEMU

安装qemu, sudo apt install qemu-system-x86,


```shell
sudo apt install qemu qemu-system-x86
sudo apt install libc6-dev:i386

```

## compiler toolchain

直接运行make就可以了!

```shell
make qemu
make qemu-nox // run it wiht following frag?
make qemu-nox-gdb // with gdb enabled

# quit qemu container, Ctrl-a c
# type quit to exit qemu

```

## add custom c files

复制wc.c

添加到makefile里面去,



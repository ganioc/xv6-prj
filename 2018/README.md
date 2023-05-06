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

### Compile jos project

```shell
make V=1
ld -o obj/kern/kernel -m elf_i386 -T kern/kernel.ld -nostdlib obj/kern/entry.o obj/kern/entrypgdir.o obj/kern/init.o obj/kern/console.o obj/kern/monitor.o obj/kern/printf.o obj/kern/kdebug.o  obj/kern/printfmt.o  obj/kern/readline.o  obj/kern/string.o /usr/lib/gcc/x86_64-linux-gnu/11/libgcc.a -b binary 

```

报错了:

```shell
ld: warning: section `.bss' type changed to PROGBITS
ld: obj/kern/printfmt.o: in function `printnum':
# Errors
lib/printfmt.c:41: undefined reference to `__udivdi3'
ld: lib/printfmt.c:49: undefined reference to `__umoddi3'

# 链接时, 报错。缺少求余和除法操作,
# 可是查找libgcc.a后发现里面确实有上述2个函数,这是为什么呢？
安装32bit libgcc.a,
sudo apt install ia32-libs
apt-get install gcc-4.8-multilib
sudo apt install gcc-multilib g++-multilib
# libgcc.a是干什么的呢？


```


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

qemu的命令

### qemu-img

    qemu-img is used to convert various file systems used by hypervisors like Xen, KVM, VMware, VirtualBox. to format guest images, add additional storage devices and network storage. The 


```
create
check
convert
info
snapshot
commit # apply to an existing disk image
rebase, // create a new base image based on an existing disk image
resize, // to increase or decrease the size of an existing disk image

```

Supported disk formats,

```
raw, default image format, 
qcow2,  QEMU image format, most versatile format,
vmdk,  VMware compatible image format,
cloop, only to reuse directly compressed CD-ROM images, e.g. in Knoppix CD-ROMs, It is Linux compressed Loop image

```

例子:

```shell
qemu-img create -f raw ubuntu.img 10G

qemu-img info ubuntu.img

# To install OS to the created disk image
# Need installation medium such as cdrom or ISO image file,
qemu-system-x86_64 -m 512 -hda ~/path/virt/arch.qcow2 -cdrom ~/path/iso/CentOS-7-x86_64.iso -enable-kvm


```

### qemu-io
To exercise the QEMU I/O path.



### qemu-nbd
Network block device. 

### qemu-pr-helper
Persistent reservation helper.
zuowei作为一个服务，支持一个持久存储功能。


### qemu-storage-daemon


### qemu-system-i386

### qemu-system-x86_64

### qemu-system-x86_64-microvm
microvm, virtual platform, a machine type inspired by Firecracker,

it's a minimalist machine type without PCI nor ACPI support, designed for short-lived guests. microvm also establishes a baseline for benchmarking and optimizaing both QEMU and guest operating system. Optimized for both boot time and footpritn,


### qemu-system-x86_64-spice
Spice protocol for virtual desktops.



## add custom c files

复制wc.c

添加到makefile里面去,



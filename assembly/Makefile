
# Use pipes rather than temporary files for communication between the
# various stages of compilation.  This fails to work on some systems where
# the assembler is unable to read from a pipe; but the GNU assembler has no
# trouble.
CC := gcc -pipe

# $ as --version
# GNU assembler (GNU Binutils for Ubuntu) 2.38
AS := as 
LD := ld

# Compiler flags
# -fno-builtin is required to avoid refs to undefined functions in the kernel.
# Only optimize to -O1 to discourage inlining, which complicates backtraces.
CFLAGS := $(CFLAGS) $(DEFS) $(LABDEFS) -O1 -fno-builtin -I$(TOP) -MD
CFLAGS += -fno-omit-frame-pointer
CFLAGS += -std=gnu99
CFLAGS += -static
CFLAGS += -Wall -Wno-format -Wno-unused -Werror -gstabs -m32

# Common linker flags
# LDFLAGS := -m elf_i386

all: ctest hello loop reverse

ctest: ctest.c
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
hello: hello.o
	ld -o hello  $^
hello.o: hello.asm 
	nasm -f elf64 -o hello.o $^

loop: loop.o 
	ld -o loop $^
loop.o: loop.asm 
	nasm -f elf64 -o $@ $^

reverse: reverse.o 
	ld -o reverse $^
reverse.o: reverse.asm 
	nasm -f elf64 -o $@ $^

clean:
	rm -rf ctest hello *.o loop reverse a.out 

.PHONY: all
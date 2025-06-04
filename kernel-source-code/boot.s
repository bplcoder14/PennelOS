# Create constants that the multiboot header will use. (see gnu multiboot standard page)
.set MAGIC, 0x1BADB002
.set FLAGS, 0x00000003 
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
.align 4 # you could .align 2 here if you want but align for is a bit safer for a few specific reason i won't list here just look it up
.long MAGIC
.long FLAGS
.long CHECKSUM

.section .bss
.align 16
stack_bottom:
.skip 16384 # 16 KiB
stack_top:

.section .text
.global _start
.type _start, @function
_start:
  mov $stack_top, %esp
  call kernel_main
  cli
1:hlt
	jmp 1b

.size _start, . - _start

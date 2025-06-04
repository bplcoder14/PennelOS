echo compiling boot file
if i686-elf-as ./kernel-source-code/boot.s -o ./kernel-compiled-code/boot.o; then
  echo boot file successfully compiled
else
  echo failed to compile boot file
  exit 1
fi

echo compiling the kernel
if i686-elf-gcc -c ./kernel-source-code/kernel.c -o ./kernel-compiled-code/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra; then
  echo compiling the kernel successfully compiled
else
  echo failed to compile boot file
  exit 1
fi

echo building PennelOS
if i686-elf-gcc -T ./kernel-source-code/linker.ld -o ./kernel-compiled-code/PennelOS.bin -ffreestanding -O2 -nostdlib ./kernel-compiled-code/boot.o ./kernel-compiled-code/kernel.o -lgcc; then
  echo PennelOS successfully built
else
  echo failed to compile boot file
  exit 1
fi

if grub-file --is-x86-multiboot ./kernel-compiled-code/PennelOS.bin; then
  echo PennelOS is multiboot complient
else
  echo PennelOS is not multiboot complient
fi

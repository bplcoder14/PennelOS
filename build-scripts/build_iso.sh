echo Setting up ISO files
if ! cp ./kernel-compiled-code/PennelOS.bin isodir/boot/PennelOS.bin; then
  echo ERROR: Failed to copy PennelOS.bin to iso/boot/ direcory
  exit 1
fi

if ! cp grub.cfg isodir/boot/grub/grub.cfg; then
  echo ERROR: Failed to copy PennelOS.bin to iso/boot/ direcory
  exit 1
fi
echo Successfully setup ISO files

echo Set up ISO files successfully
echo Creating ISO
if grub-mkrescue -o PennelOS.iso isodir; then
  echo Successfully made ISO file
else
  echo ERROR: Failed to make ISO file
  exit 1
fi

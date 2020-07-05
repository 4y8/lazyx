#!/bin/sh -e
nasm -fbin ./boot_sector.asm -o ./boot_sector.bin
nasm -fbin ./kernel.asm -o ./kernel.bin
cat ./boot_sector.bin ./kernel.bin root.fs > os.bin
rm ./boot_sector.bin ./kernel.bin
qemu ./os.bin

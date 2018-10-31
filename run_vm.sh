#!/bin/bash
IMGFILE=./qemu-image.img
KERNELADDR=linux/arch/x86_64/boot/bzImage

qemu-system-x86_64 -m 4G -smp 2 --enable-kvm \
-kernel $KERNELADDR \
-drive format=raw,file=$IMGFILE \
-append "root=/dev/sda console=ttyS0" \
-vnc :1,ocssdvnc -monitor stdio \
-net nic -net tap,ifname=tap0,script=no

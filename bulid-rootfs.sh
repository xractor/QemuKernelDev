#!/bin/bash
IMGNAME=qemu-rootfs.img
IMGSIZE=10G

#ubuntu version, change cosmic (ubuntu 18.10) to your needs 
UBUNTUVER=cosmic
IMGARCH=amd64

TEMPDIR=tmpdir

#create a raw image
qemu-img create $IMGNAME  $IMGSIZE

#setup ext4 file system on the image
mkfs.ext4 $IMGNAME

#use debootstrap to build a chroot environment
mkdir -p $TEMPDIR
sudo mount -o loop $IMGNAME $TEMPDIR
#usage: debootstrap --arch ARCH RELEASE INSTALLDIR [mirror URL]
#if you only need basic system add -variant minbase 
sudo debootstrap --variant=minbase --arch=$IMGARCH $UBUNTUVER $TEMPDIR 

#chroot into installed system
sudo mount -o bind /dev $TEMPDIR/dev
sudo mount -o bind /dev/pts $TEMPDIR/dev/pts
sudo mount -o bind /proc $TEMPDIR/proc
sudo mount -o bind /sys $TEMPDIR/sys

#Optinal install additional tools 
sudo chroot $TEMPDIR /bin/bash -x << 'EOF'
apt update
apt -y install net-tools
apt -y install ifupdown
EOF

sudo umount $TEMPDIR/sys
sudo umount $TEMPDIR/proc
sudo umount $TEMPDIR/dev/pts
sudo umount $TEMPDIR/dev
sudo umount $TEMPDIR
rmdir $TEMPDIR


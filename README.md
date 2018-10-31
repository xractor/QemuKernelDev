# QemuKernelDev
QEMU Linux Kernel development environment setup scripts

- build-rootfs.sh: build a rootfs on an image file
- build-kernel.sh: build Kernel image
- run-vm.sh: virtual machine parameters
- setup-tap.sh: setup a bridge interface for guest OS

## Pre-requisites

- An Ubuntu or Debian system
- QEMU and its required packages 
```
sudo apt install qemu qemu-kvm libvirt-bin
```
- debootstrap: bootstraps a basic Debian/Ubuntu system into a directory
```
sudo apt install debootstrap
```

## Optional

- bridged network
```
sudo apt bridge-utils

```

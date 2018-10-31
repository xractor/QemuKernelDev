#!/bin/bash

git clone --depth=1 git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
cd linux
make x86_64_defconfig
make kvmconfig
make -j 8

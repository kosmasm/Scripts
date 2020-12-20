#!/bin/bash
kernel=`eselect kernel list | grep \* | awk '{print $2}'`
echo Building $kernel
cd /usr/src/$kernel
# make oldconfig && make -j7 && make modules_install && make install && genkernel --firmware --install initramfs && grub-mkconfig -o /boot/grub/grub.cfg && emerge nvidia-drivers
make KCFLAGS="-march=native" -j7 && make modules_install && make install && genkernel --microcode --install initramfs && grub-mkconfig -o /boot/grub/grub.cfg && grub-install /dev/nvme0n1 && emerge -1 r8168


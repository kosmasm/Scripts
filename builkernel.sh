#!/bin/bash
kernel=`eselect kernel list | grep \* | awk '{print $2}'`
echo Building $kernel
cd /usr/src/$kernel
# make oldconfig && make -j7 && make modules_install && make install && genkernel --firmware --install initramfs && grub-mkconfig -o /boot/grub/grub.cfg && emerge nvidia-drivers
make oldconfig && make -j7 && make modules_install && make install && genkernel --firmware --install initramfs && grub-mkconfig -o /boot/grub/grub.cfg

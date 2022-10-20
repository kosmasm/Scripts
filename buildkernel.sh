#!/bin/bash
eselect kernel list
read kset
eselect kernel set $kset
kernel=`eselect kernel list | grep \* | awk '{print $2}'`
kv=${kernel}"-x86_64"
kver=$(echo $kv | sed s/linux-//)
echo Building $kernel
cd /usr/src/$kernel
echo kernel=$kernel kv=$kv kver=$kver
# make oldconfig && make -j7 && make modules_install && make install && genkernel --firmware --install initramfs && grub-mkconfig -o /boot/grub/grub.cfg && emerge nvidia-drivers
make -j16 && make -j16 modules_install && make install && emerge -1 ryzen_smu && dracut --force --kver=$kver && grub-mkconfig -o /boot/grub/grub.cfg && grub-install /dev/nvme0n1

#!/bin/bash
mount /mnt/4TB
eselect kernel list
read kset
eselect kernel set $kset
kernel=`eselect kernel list | grep \* | awk '{print $2}'`
kv=${kernel}"-x86_64"
kver=$(echo $kv | sed s/linux-//)
echo Building $kernel
cd /usr/src/$kernel
# echo kernel=$kernel kv=$kv kver=$kver
[ -f .config ] || make oldconfig
# export KCFLAGS=' -march=native -mtune=native -mshstk --param=l1-cache-line-size=64 --param=l1-cache-size=32 --param=l2-cache-size=512 -pipe '
# export KCFLAGS=' -pipe -fomit-frame-pointer -march=native -mtune=native -mshstk --param=l1-cache-line-size=64 --param=l1-cache-size=32 --param=l2-cache-size=512 '
# export KCPPFLAGS=' -march=native -mtune=native -mshstk --param=l1-cache-line-size=64 --param=l1-cache-size=32 --param=l2-cache-size=512 -pipe '
# export KCPPFLAGS=' -pipe -fomit-frame-pointer -march=native -mtune=native -mshstk --param=l1-cache-line-size=64 --param=l1-cache-size=32 --param=l2-cache-size=512 '
# make oldconfig && make -j7 && make modules_install && make install && genkernel --firmware --install initramfs && grub-mkconfig -o /boot/grub/grub.cfg && emerge nvidia-drivers
# make -j16 && make -j16 modules_install && make install && emerge -1 ryzen_smu sys-apps/openrazer sys-fs/zfs-kmod && dracut --force --kver=$kver && grub-mkconfig -o /boot/grub/grub.cfg && grub-install /dev/nvme0n1
# make -j16 && make -j16 modules_install && make install && emerge -1 sys-fs/zfs-kmod app-admin/ryzen_smu sys-apps/openrazer && dracut --no-hostonly-i18n --force --kver=$kver && grub-mkconfig -o /boot/grub/grub.cfg && grub-install /dev/nvme0n1
# No zfs.
export KCFLAGS=' -pipe -fomit-frame-pointer -march=native -mtune=native '
export KCPPFLAGS=' -pipe -fomit-frame-pointer -march=native -mtune=native  '
make -j24 && \
make -j24 modules_install && \
make install && \
cp .config /boot/config-$kver && \
# emerge --keep-going @module-rebuild && \
# dracut --no-hostonly-i18n --force --kver=$kver && \
# grub-mkconfig -o /boot/grub/grub.cfg && \
# grub-install /dev/nvme0n1
echo Installed kernel=$kernel kv=$kv kver=$kver

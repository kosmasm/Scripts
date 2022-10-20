yum install kmod-catalyst 
init 3
catalyst-config-display enable
new-kernel-pkg --kernel-args=nomodeset --mkinitrd --dracut --update $(rpm -q --queryformat="%{version}-%{release}.%{arch}\n" kernel | tail -n 1)


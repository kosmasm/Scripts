#!/bin/bash
# For Kargos Plasma Applet
# temp=$(sensors | grep -oP 'Core.*?\+\K[0-9.]+')
# temp0=$(sensors | grep 'Core 0' | cut -c '16-17')
# temp1=$(sensors | grep 'Core 1' | cut -c '16-17')
# temp2=$(sensors | grep 'Core 2' | cut -c '16-17')
# temp3=$(sensors | grep 'Core 3' | cut -c '16-17')
# hdd_temp=$(nc localhost 7634 | cut -c '33-34')
nvme=$(sensors | grep -A 2 'nvme-pci' | grep 'Composite' | cut -c 16-19)
gpu_temp=$(sensors | grep -A 4 'amdgpu-pci' | grep 'edge' | cut -c 16-19)
gpu2_temp=$(sensors | grep -A 6 'amdgpu-pci' | grep 'junction' | cut -c 16-19)
temp1=$(sensors | grep -A 14 'acpitz-acpi' | grep 'temp1' | cut -c 16-19)
temp2=$(sensors | grep -A 15 'acpitz-acpi' | grep 'temp2' | cut -c 16-19)
temp3=$(sensors | grep -A 16 'acpitz-acpi' | grep 'temp3' | cut -c 16-19)
cpu1=$(sensors | grep -A 2 'k10temp-pci' | grep 'Tctl' | cut -c 16-19)
cpu2=$(sensors | grep -A 3 'k10temp-pci' | grep 'Tccd1' | cut -c 16-19)
cpu3=$(sensors | grep -A 4 'k10temp-pci' | grep 'Tccd2' | cut -c 16-19)


vddgfx=$(sensors | grep -A 2 'amdgpu-pci' | grep 'vddgfx' | cut -c 14-19)
fan1=$(sensors | grep -A 3 'amdgpu-pci' | grep 'fan1' | cut -c 13-18)
power1=$(sensors | grep -A 10 'amdgpu-pci' | grep 'PPT' | cut -c 13-19)
edge=$(sensors | grep -A 4 'amdgpu-pci' | grep 'edge' | cut -c 16-19)
junction=$(sensors | grep -A 6 'amdgpu-pci' | grep 'junction' | cut -c 16-19)
mem=$(sensors | grep -A 8 'amdgpu-pci' | grep 'mem' | cut -c 16-19)

NVMEPCI=$( sensors | grep -A 2 'nvme-pci' | grep 'Composite' | cut -c 16-19 )
#NVMEPCI2=$(sensors | grep Sensor\ 2 | cut -c 16-19)
SDA=$(smartctl -a /dev/sda | grep ^194 | awk '{print $10}')
SDB=$(smartctl -a /dev/sdb | grep ^194 | awk '{print $10}')
SDC=$(smartctl -a /dev/sdc | grep ^194 | awk '{print $10}')
echo "<br><font size='1'>\
CPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GPU&nbsp;&nbsp;&nbsp;&nbsp;GPU2&nbsp;&nbsp;&nbsp;NVME\
</font><br>\
${cpu1}°&nbsp;&nbsp;${cpu2}°&nbsp;&nbsp;${cpu3}°&nbsp;&nbsp;${gpu_temp%%.*}°&nbsp;&nbsp;${gpu2_temp%%.*}°&nbsp;&nbsp;${nvme%%.*}°\
<font size='1'><br>\
vddgfx&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fan1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;power1\
</font><br>\
${vddgfx}mV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${fan1}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${power1}W\
<font size='1'><br>\
edge&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;junction&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mem\
</font><br>\
${edge}&nbsp;&nbsp;&nbsp;&nbsp;${junction}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${mem}\
<font size='1'><br>\
NVMEPCI\
</font><br>\
${NVMEPCI}°\
| font=Hack-Regular size=10"
# Uncomment the lines below if you want to be able to click on the kargos widget and display a pop-up TOP
# ho "---"
# P_OUTPUT=$(top -b -n 1 | head -n 20 | awk 1 ORS="\\\\n")
# ho "$TOP_OUTPUT | font=monospace iconName=htop"

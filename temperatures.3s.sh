#!/bin/bash
# For Kargos Plasma Applet
# temp=$(sensors | grep -oP 'Core.*?\+\K[0-9.]+')
# temp0=$(sensors | grep 'Core 0' | cut -c '16-17')
# temp1=$(sensors | grep 'Core 1' | cut -c '16-17')
# temp2=$(sensors | grep 'Core 2' | cut -c '16-17')
# temp3=$(sensors | grep 'Core 3' | cut -c '16-17')
# hdd_temp=$(nc localhost 7634 | cut -c '33-34')
nvme=$(sensors | grep -A 2 'nvme-pci' | grep 'Composite' | cut -c 16-19)
gpu_temp=$(sensors | grep -A 4 'amdgpu-pci-0700' | grep 'edge' | cut -c 16-19)
temp1=$(sensors | grep -A 14 'it8792-isa' | grep 'temp1' | cut -c 16-19)
temp2=$(sensors | grep -A 15 'it8792-isa' | grep 'temp2' | cut -c 16-19)
temp3=$(sensors | grep -A 16 'it8792-isa' | grep 'temp3' | cut -c 16-19)
cpu1=$(sensors | grep -A 5 'k10temp-pci' | grep 'Tdie' | cut -c 16-19)
cpu2=$(sensors | grep -A 4 'k10temp-pci' | grep 'Tctl' | cut -c 16-19)
vddgfx=$(sensors | grep -A 2 'amdgpu-pci' | grep 'vddgfx' | cut -c 14-19)
fan1=$(sensors | grep -A 3 'amdgpu-pci' | grep 'fan1' | cut -c 13-18)
power1=$(sensors | grep -A 5 'amdgpu-pci' | grep 'power1' | cut -c 13-19)
sensor1=$(sensors | grep Sensor\ 1 | cut -c 16-19)
sensor2=$(sensors | grep Sensor\ 2 | cut -c 16-19)
echo "<br><font size='1'>CPU1&nbsp;&nbsp;CPU2&nbsp;&nbsp;GPU&nbsp;&nbsp;&nbsp;&nbsp;HDD&nbsp;&nbsp;Temp1&nbsp;&nbsp;&nbsp;Temp2&nbsp;&nbsp;&nbsp;Temp3</font><br>${cpu1%%.*}°&nbsp;&nbsp;${cpu2%%.*}°&nbsp;&nbsp;${gpu_temp%%.*}°&nbsp;&nbsp;${nvme%%.*}°&nbsp;${temp1%%}°&nbsp;${temp2%%}°&nbsp;${temp3%%}°<br><font size='1'>vddgfx&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fan1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;power1</font><br>${vddgfx}mV&nbsp;${fan1}&nbsp;${power1}W<br><font size='1'>Sensor1&nbsp;&nbsp;Sensor2</font><br>${sensor1}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sensor2}| font=Hack-Regular size=10"
# Uncomment the lines below if you want to be able to click on the kargos widget and display a pop-up TOP
# ho "---"
# P_OUTPUT=$(top -b -n 1 | head -n 20 | awk 1 ORS="\\\\n")
# ho "$TOP_OUTPUT | font=monospace iconName=htop"

modprobe snd-pcm
modprobe snd-mixer-oss
modprobe snd-pcm-oss
echo "et.x86 0 0 direct" > /proc/asound/card0/pcm0p/oss
echo "et.x86 0 0 disable" > /proc/asound/card0/pcm0c/oss

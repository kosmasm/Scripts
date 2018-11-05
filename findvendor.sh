#!/bin/bash

[ "$1" == "" ] && { echo No network; exit 1; }

/usr/bin/nmap -sP $1 > /dev/null
/usr/sbin/arp -a | grep -v incompl | awk '{print $4}' > /tmp/tmp1.tmp
for a in `cat /tmp/tmp1.tmp`; do /usr/local/bin/oui $a; done

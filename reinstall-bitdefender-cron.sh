#!/bin/bash
echo Start
days=$(bdscan --info | grep "Trial key found" | grep "days remaining." | awk '{print $4}')
echo $days
[ "$days" == "1" ] && {
  /usr/src/bitdefender/scripts/PREUN
  rm -rf /opt/BitDefender-scanner
  /usr/src/bitdefender/scripts/POSTUN
  cd /
  cpio -ivdum < /usr/src/bitdefender/program/CONTENTS.cpio
  /usr/src/bitdefender/scripts/POSTIN
  cd /opt/BitDefender-scanner/var/lib/scan/
  ln -s Plugins plugins
  ln -s Plugins PLUGINS
  /opt/BitDefender-scanner/bin/bdscan --update
}

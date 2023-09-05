#!/bin/bash
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

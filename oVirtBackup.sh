#!/bin/bash
file="backup"-`date +%d-%m-%Y`
echo $file
cd /tmp
engine-backup --mode=backup --file=/tmp/${file}.bak --log=/tmp/${file}.log
zip ${file}.zip ${file}.bak ${file}.log
scp -P 22022 ${file}.zip antyxsoftovirt@ns2.kosmas.gr:~

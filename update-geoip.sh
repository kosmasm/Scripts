#!/bin/bash
# geoipupdate -v
wget -q --user "512891" --password "xxxxxxxxxxxxxxxxx" "https://download.maxmind.com/geoip/databases/GeoLite2-Country-CSV/download?suffix=zip" -O /tmp/GeoIP.zip
/usr/local/geolite2legacy/geolite2legacy.py -i /tmp/GeoIP.zip -o /usr/share/GeoIP/GeoIP.dat
rm -f /tmp/GeoIP.zip

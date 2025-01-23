#!/bin/bash

[ "$(whoami)" == "root" ] && echo User is root, continuing...  || { echo Not root. Exiting.; exit 1; }
mountpoint -q /mnt/4TB || mount /mnt/4TB
mountpoint -q /mnt/4TB && echo /mnt/4TB already mounted
interactive=0
nosync=0
verbose=0

while getopts 'ivhn' opt; do
  case "$opt" in
    i)
      echo "Running interactively"
      interactive=1
      ;;

    v)
      echo "Running with verbose"
      verbose=1
      ;;

    n)
      echo "Running with no syncing"
      nosync=1
      ;;

    h)
      echo "Usage: $(basename $0) [-i] [-v]"
      exit 0
      ;;

    ?)
      echo -e "Invalid command option.\nUsage: $(basename $0) [-i] [-v]"
      exit 1
      ;;
  esac
done

shift "$(($OPTIND -1))"

[ $verbose ] && quiet=-v || quiet=-q
[ $nosync ] && {
    [ $verbose ] && emerge --sync || emerge --sync $quiet
}
[ $interactive ] && { echo Press Enter to proceed with emerge; read; }
[ $verbose ] && emerge -avDNu --with-bdeps=y --keep-going @world || emerge -aqDNu --with-bdeps=y --keep-going @world
[ $interactive ] && { echo Press Enter to proceed with reserved-rebuild; read; }
[ $verbose ] && emerge @preserved-rebuild || emerge -q @preserved-rebuild
[ $interactive ] && { echo Press Enter to proceed with reserved-rebuild; read; }
revdep-rebuild
[ $interactive ] && { echo Press Enter to proceed with depclean; read; }
[ $verbose ] && emerge --depclean --exclude gcc --exclude gentoo-sources || emerge -q --depclean --exclude gcc --exclude gentoo-sources
[ $interactive ] && { echo Press Enter to proceed with eclean-dist; read; }
eclean-dist
[ $interactive ] && { echo Press Enter to proceed with eclean-pkg; read; }
eclean-pkg
[ $interactive ] && { echo Press Enter to proceed with emerge regen; read; }
[ $verbose ] && emerge -q --regen || emerge --regen
[ $interactive ] && { echo Press Enter to proceed with emaint check; read; }
emaint --check world
[ $interactive ] && { echo Press Enter to run updates; read; }
freshclam
[ $verbose ] && sa-update -v || sa-update
[ $verbose ] && bdscan --update --verbose || bdscan --update
[ $interactive ] && { echo Press Enter to run fstrim; read; }

# Run fstrim only if a week has passwd from last time
last=$(cat /usr/local/bin/emergeall.time)
now=$(date +%s)
let timed=${now}-${last}
[ $timed -lt 86400 ] && {
    [ $verbose ] && $echo Less than a week fstrimed
} || {
    [ $verbose ] && fstrim -v -a || fstrim -a
    date +%s > /usr/local/bin/emergeall.time
}

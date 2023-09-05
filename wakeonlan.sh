#!/bin/sh
case $1 in
	start) /usr/sbin/ethtool -s eth0 wol g ;;
	stop) /usr/sbin/ethtool -s eth0 wol g ;;
	*) /usr/sbin/ethtool -s eth0 wol g ;;
esac


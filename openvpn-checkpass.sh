#!/bin/bash

passfile=/etc/openvpn/server/pass.txt

# Check param exists
[ "$1" == "" ] && exit 2;

# Check file exists
[ -f $1 ] || exit 3;

# Check file contains 2 lines
lines=$(wc -l $1|awk '{print $1}');
[ $lines = 2 ] || exit 4;

# Get username and password from file
IFS=$'\n' read -d '' -r -a lines < $1
username=${lines[0]}
password=${lines[1]}

# Exit if any has null value
[ "$username" == "" ] && exit 5;
[ "$password" == "" ] && exit 6;

# Get password for user
testpass=$(grep $username $passfile|awk '{print $2}')

[ "$testpass" == "$password" ] && exit 0 || exit 1;


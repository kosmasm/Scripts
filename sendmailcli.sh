#!/bin/bash

HOST=192.168.71.254
PORT=25
FROM="kosmas@kosmas.gr"
TO="k.mackrogamvrakis@unipath.biz"
SUBJECT="Test"
BODY="Test from telnet..."
DATE=`date`
( echo "open $HOST $PORT"; sleep 0.7; echo "helo kosmas.gr"; sleep 0.5; echo "mail from: $FROM"; sleep 0.5; echo "rcpt to: $TO"; sleep 0.5; echo "data"; sleep 0.5; echo "Date: $DATE" echo "From: $FROM"; echo "To: $TO"; echo "Subject: $SUBJECT"; echo ""; echo "$BODY"; echo ""; echo "."; sleep 0.5; echo "quit"; ) | telnet

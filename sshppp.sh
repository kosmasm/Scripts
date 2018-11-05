/usr/sbin/pppd updetach noauth silent nodeflate pty "/usr/bin/ssh root@$1 $2 $3 $4 $5 $6 $7 $8 $9 /usr/sbin/pppd nodetach notty noauth" ipparam vpn 10.20.30.1:10.20.30.254

#!/usr/bin/env bash
if [ $# -ne 2 ]; then
    echo "[*] HTTP Enum"
    echo "[*] Usage : $0 <target> <port>"
    exit 0
fi

curl -i $1:$2 2>&1 | tee $1_$2.headers.txt
w3m -dump $1:$2/robots.txt | tee $1_$2_robots.txt
VHostScan -t $1 -p $2 -oN $1_$2_vhosts.txt
nikto -h $1 -p $2 -output $1_$2_nikto.txt
dirb http://$1:$2/ -o $1_$2_dirb.txt

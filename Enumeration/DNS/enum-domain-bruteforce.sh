#!/bin/bash
if [ $# -ne 2 ]; then
    echo "[*] DNS IP Enum"
    echo "[*] Usage : $0 <domain> <dict_file>"
    exit 0
fi

# if argument was given, identify the DNS servers for the domain
dnsrecon -d $1 -D $2 -t brt > dns-$domain.brute.txt

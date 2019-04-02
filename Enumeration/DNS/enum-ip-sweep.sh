#!/bin/bash
if [ $# -ne 2 ]; then
    echo "[*] DNS IP Enum"
    echo "[*] Usage : $0 <target> <range>"
    exit 0
fi

# if argument was given, identify the DNS servers for the domain
dnsrecon -n $1 -r $2 > dns-prt-enum.txt

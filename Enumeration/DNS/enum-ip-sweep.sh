#!/usr/bin/env bash
usage () {
    echo "[*] DNS IP Enumeration"
    echo "[*] Usage : $0 <target> <range>"
    echo "[*] Ex1 : $0 10.0.0.25 10.0.0.0/24"
    echo "[*] Ex2 : $0 dc1.example.com 192.168.1.0/24"
    exit 0
}

if [ $# -ne 2 ]; then
    usage
else
    dnsrecon -n $1 -r $2 > dns-prt-enum.txt
fi

#    -n, --name_server <name>     Domain server to use. If none is given, the SOA of the target will be used.
#                                 Multiple servers can be specified using a comma separated list.
#    -r, --range       <range>    IP range for reverse lookup brute force in formats (first-last) or in (range/bitmask).

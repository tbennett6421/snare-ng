#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "[*] DNS Domain Enum"
    echo "[*] Usage : $0 <domain name>"
    exit 0
fi

# if argument was given, identify the DNS servers for the domain
dnsrecon -d $1 -t zonewalk  > dns-$domain.walk
dnsrecon -d $1 -t axfr > dns-$domain.zone

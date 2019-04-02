#!/bin/bash
if [ $# -ne 2 ]; then
    echo "[*] snmp-check"
    echo "[*] Usage : $0 <target> <community_string>"
    exit 0
fi

touch $1.snmpcheck.output && echo "snmp-check $1 -c $2 | tee -a $1.snmpcheck.output" > $1.snmpcheck.output
snmp-check $1 -c $2 | tee -a $1.snmpcheck.output
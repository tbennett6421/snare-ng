#!/usr/bin/env bash
if [ $# -ne 2 ]; then
    echo "[*] HTTP Busting"
    echo "[*] Usage : $0 <target> <port>"
    exit 0
fi

dirbuster -H -u http://$1:$2/ -l /usr/share/wordlists/dirbuster/directory-list-lowercase-2.3-medium.txt -t 20 -s / -v -r $1_$2_dirbuster_medium.txt
gobuster -w /usr/share/seclists/Discovery/Web-Content/common.txt -u http://$1:$2/ -s '200,204,301,302,307,403,500' -e | tee $1_$2_gobuster_common.txt
gobuster -w /usr/share/seclists/Discovery/Web-Content/CGIs.txt -u http://$1:$2/ -s '200,204,301,307,403,500' -e | tee $1_$2_gobuster_cgis.txt

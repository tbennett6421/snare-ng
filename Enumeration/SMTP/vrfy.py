#!/usr/bin/python

# Author: Tyler Bennett
# taken from various sources online and offsec
# I just wanted to make it less patch-work

from __future__ import print_function

import sys
import socket
import argparse

def vrfy(args, user):
    # Create a Socket
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # Connect to the Server
    _ = s.connect(args.ip, args.port)
    # Receive the banner
    banner = s.recv(1024)
    print(banner)
    # VRFY a user
    s.send('VRFY ' + user + '\r\n')
    result = s.recv(1024)
    print(result)
    # Close the socket
    s.close()

def attack(args):
    if args.userfile != None:
        with open(args.userfile) as f:
            content = f.readlines()
        content = [x.strip() for x in content]
        uniq = list(set(content))
        for x in uniq:
            vrfy(args, x)
    else:
        vrfy(args, args.username)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-p','--port',required=False,type=int,help='Remote smtp port. Default is 25',default=25)
    parser.add_argument('-ip','--address',required=True,help='IP Address to attack.  Default is 127.0.0.1',default='127.0.0.1')
    parser.add_argument('-u','--username',required=False,help='Username to check target against')
    parser.add_argument('-U','--userfile',required=False,help='File containing usernames to check target against. Overrides -u')
    args = parser.parse_args()
    if args.username == None and args.userfile == None:
        print("Username (-u) or Userfile (-U) must be set")
        sys.exit(1)
    attack(args)
    sys.exit(0)

if __name__=="__main__":
    main()

#!/usr/bin/python

# Author: Tyler Bennett
# taken from various sources online and offsec
# I just wanted to make it less patch-work

from __future__ import print_function

import sys
import socket
import argparse
from pprint import pprint

def fatal(arg, prefix='[!] '):
    console(arg, prefix)

def info(arg, prefix="[*] "):
    console(arg, prefix)

def console(arg, prefix="[*] "):
    print(prefix+arg)

def fuzz(args):
    buffer=["A"]
    counter=100
    while len(buffer) <= 30:
    	buffer.append("A"*counter)
    	counter = counter + args.step

    for string in buffer:
        try:
            console("Fuzzing application with %s bytes" % len(string))
            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

            if(args.blocking == True):
                pass
            else:
                s.settimeout(args.timeout)
            _ = s.connect((args.address,args.port))
            s.recv(1024)
            s.send(string + '\r\n')
        except socket.timeout as e:
            info("success?!?", "[+] ")
            sys.exit(0)
            pass
        except socket.error as e:
            fatal("%s : %d " %  (e.strerror, e.errno))
            fatal("Check your target. Is system shunning us?")
            sys.exit(1)
        except Exception as e:
            raise

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-p','--port',required=True,type=int,help='port to fuzz')
    parser.add_argument('-ip','--address',required=True,help='IP Address to attack.  Default is 127.0.0.1',default='127.0.0.1')
    parser.add_argument('-s','--step',required=False,type=int,help='Number of bytes to increment. Default is 200',default=200)
    parser.add_argument('-b', '--blocking',required=False,action='store_true', help="Whether or not to place the socket in blocking mode. The default is to set non-blocking and defines a timeout of 3 seconds")
    parser.add_argument('-t','--timeout',required=False,type=int,help='The number of seconds to wait for a response, ignored if in blocking mode. The default is 3 seconds',default=3)
    args = parser.parse_args()
    fuzz(args)

if __name__=="__main__":
    main()

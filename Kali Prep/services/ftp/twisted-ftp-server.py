"""
An example FTP server with minimal user authentication.
"""

#
# First, set up a portal (twisted.cred.portal.Portal). This will be used
# to authenticate user logins, including anonymous logins.
#
# Part of this will be to establish the "realm" of the server - the most
# important task in this case is to establish where anonymous users will
# have default access to. In a real world scenario this would typically
# point to something like '/pub' but for this example it is pointed at the
# current working directory.
#
# The other important part of the portal setup is to point it to a list of
# credential checkers. In this case, the first of these is used to grant
# access to anonymous users and is relatively simple; the second is a very
# primitive password checker.  This example uses a plain text password file
# that has one username:password pair per line. This checker *does* provide
# a hashing interface, and one would normally want to use it instead of
# plain text storage for anything remotely resembling a 'live' network. In
# this case, the file "pass.dat" is used, and stored in the same directory
# as the server. BAD.
#
# Create a pass.dat file which looks like this:
#
# =====================
#   jeff:bozo
#   grimmtooth:bozo2
# =====================
#

from __future__ import print_function
from __future__ import absolute_import

## Dunders
__code_desc__ = """ Simple FTP server via twisted \n    ex: python {name}
    """.format(name=str(__name__)+'.py')
__code_version__ = 'v0.0.1'

## Standard Libraries
import os
import argparse

## Third-Party Libraries
from twisted.protocols.ftp import FTPFactory, FTPRealm
from twisted.cred.portal import Portal
from twisted.cred.checkers import AllowAnonymousAccess, FilePasswordDB
from twisted.internet import reactor

def collect_args():
    parser = argparse.ArgumentParser(description=__code_desc__,
        formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument('-V', '--version', action='version', version=__code_version__)
    parser.add_argument('-v', '--verbose', action='count', default=0)
    parser.add_argument('-p', '--port', type=int, default=21,
        help="TCP Port to bind to (default: %(default)s)")
    parser.add_argument('-i','--address', type=str, default='',
        help="IP address to bind to. (default: %(default)s)")
    parser.add_argument('--auth', type=str, default='/ftpdata/pass.dat',
        help="Authentication database to use (default: %(default)s)")
    parser.add_argument('--root', type=str, default='/ftproot',
        help="The directory to serve over ftp (default: %(default)s)")
    args = parser.parse_args()
    return parser, args

def handle_args():
    # collect parser if needed to conditionally call usage: parser.print_help()
    parser, args = collect_args()
    return args

def main():
    args = handle_args()
    try:
        launch_server(args)
    except Exception as e:
        print(f"Caught exception {e}:{e.args}")
        raise e

def launch_server(args):
    ftproot_directory = args.root
    config = args.auth
    if args.verbose:
        print(f"[*] Setting ftproot to {ftproot_directory}")
        print(f"[*] Setting FilePasswordDB to {config}")

    while True:
        try:

            if args.verbose:
                print(f"[*] Crafting twisted ftp realm")
            p = Portal(
                FTPRealm(ftproot_directory),
                [AllowAnonymousAccess(), FilePasswordDB(config)]
            )

            if args.verbose:
                print(f"[*] Crafting FTPFactory from realm")
            f = FTPFactory(p)

            if args.verbose:
                iface = "all" if args.address == "" else args.address
                print(f"[*] Spawning Twisted reactor and binding to TCP socket {iface}:{args.port}")
            reactor.listenTCP(args.port, f, interface=args.address)
            reactor.run()

        except KeyboardInterrupt:
            break

if __name__=="__main__":
    main()







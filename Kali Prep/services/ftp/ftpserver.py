"""
An example FTP server with minimal user authentication.
"""

from __future__ import print_function
from __future__ import absolute_import

## Dunders
__code_desc__ = """ Simple FTP server via pyftpdlib \n    ex: python {name}
    """.format(name=str(__name__)+'.py')
__code_version__ = 'v0.0.1'

## Standard Libraries
import argparse

## Third-Party Libraries
from pyftpdlib.authorizers import DummyAuthorizer
from pyftpdlib.handlers import FTPHandler
from pyftpdlib.servers import FTPServer

def collect_args():
    parser = argparse.ArgumentParser(description=__code_desc__,
        formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument('-V', '--version', action='version', version=__code_version__)
    parser.add_argument('-v', '--verbose', action='count', default=0)
    parser.add_argument('-p', '--port', type=int, default=21,
        help="TCP Port to bind to (default: %(default)s)")
    parser.add_argument('-i','--address', type=str, default='0.0.0.0',
        help="IP address to bind to. (default: %(default)s)")
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
    if args.verbose:
        print(f"[*] Setting ftproot to {ftproot_directory}")

    users = {
        'offsec': 'offsec'
    }

    while True:
        try:

            # create authorizer
            authorizer = DummyAuthorizer()
            for u,p in users.items():
                authorizer.add_user(u, p, ftproot_directory, perm="elradfmwMT")
            authorizer.add_anonymous(ftproot_directory)

            # create handler
            handler = FTPHandler
            handler.authorizer = authorizer

            # open socket
            if args.verbose:
                print(f"[*] Spawning ftp server {args.address}:{args.port}")
            _socket = (args.address, args.port)
            server = FTPServer(_socket, handler)
            server.serve_forever()

        except KeyboardInterrupt:
            break

if __name__=="__main__":
    main()

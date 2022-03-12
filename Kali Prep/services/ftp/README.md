# ftpserver

# Overview
During offensive engagements, I dislike configuring vsftp. So I just use pyftpdlib instead. This is not approriate for production use as it exposes anonymous ftp access.

# Usage
```
usage: ftpserver.py [-h] [-V] [-v] [-p PORT] [-i ADDRESS] [--root ROOT]

 Simple FTP server via twisted
    ex: python __main__.py

optional arguments:
  -h, --help            show this help message and exit
  -V, --version         show program's version number and exit
  -v, --verbose
  -p PORT, --port PORT  TCP Port to bind to (default: 21)
  -i ADDRESS, --address ADDRESS
                        IP address to bind to. (default: 0.0.0.0)
  --root ROOT           The directory to serve over ftp (default: /ftproot)
```

# Quickstart
```sh
# ensure prereqs are met
sudo apt install python3-venv python3-pip

# configure venv
python3 -m venv ~/kali-env
source ~/kali-env/bin/activate
pip install -r requirements.txt

# configure core directories
mkdir -p /ftproot
```

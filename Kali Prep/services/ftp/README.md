# twisted-ftp

# Overview
During offensive engagements, I dislike configuring vsftp. So I just use twisted instead. This is not approriate for production use as it exposes anonymous ftp access.

# Usage
```
usage: twisted-ftp-server.py [-h] [-V] [-v] [-p PORT] [-i ADDRESS] [--auth AUTH] [--root ROOT]

 Simple FTP server via twisted
    ex: python __main__.py

optional arguments:
  -h, --help            show this help message and exit
  -V, --version         show program's version number and exit
  -v, --verbose
  -p PORT, --port PORT  TCP Port to bind to (default: 21)
  -i ADDRESS, --address ADDRESS
                        IP address to bind to. (default: )
  --auth AUTH           Authentication database to use (default: /ftpdata/pass.dat)
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
mkdir -p /ftpdata

# Configs
wget https://raw.githubusercontent.com/tbennett6421/snare-ng/master/Kali%20Prep/services/ftp/twisted-ftp-server.py -O /ftpdata/twisted-ftp-server.py
wget https://raw.githubusercontent.com/tbennett6421/snare-ng/master/Kali%20Prep/services/ftp/pass.dat -O /ftpdata/pass.dat

```

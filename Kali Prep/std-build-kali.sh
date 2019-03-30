#!/usr/bin/env bash

## Begin
rm -rf /opt/build/ && mkdir -p /opt/build/

## Reconnoitre
mkdir -p /opt/build/Reconnoitre && cd /opt/build/Reconnoitre
git clone https://github.com/codingo/Reconnoitre.git .
python setup.py install

## Powershell Empire
mkdir -p /opt/build/Empire && cd /opt/build/Empire
git clone https://github.com/EmpireProject/Empire.git .
echo | bash ./setup/install.sh

## PTF
mkdir -p /opt/build/ptf && mkdir -p /opt/build/ptf && cd /opt/build/ptf
git clone https://github.com/trustedsec/ptf.git .

## GoBuster
apt-get install golang -y
mkdir -p /opt/build/gobuster && cd /opt/build/gobuster
git clone https://github.com/OJ/gobuster.git .
go get -u github.com/OJ/gobuster && go build

## VS Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list
apt-get install apt-transport-https -y
apt-get update
apt-get install code -y

## Install debugging/emulation tools
## mingw-w64 provides windows build environment including cross compilers
apt-get install mingw-w64 wine -y
wine -i > /dev/null 2>&1
cd /root/.wine/drive_c/users/root/Downloads/
# setup python for windows
wget https://www.python.org/ftp/python/3.7.3/python-3.7.3.exe
wget https://www.python.org/ftp/python/2.7.16/python-2.7.16.msi
echo "Use the defaults as the script will symlink everything to a more convenient location"
read -n 1 -s -r -p "Press any key to continue"
wine python-3.7.3.exe 
wine python-2.7.16.msi

## @todo: setup symlinks for python2 python3 pip
## ln -s C:\Python27 /opt/build/windows/python2.exe
## ln -s C:\Python37 /opt/build/windows/python3.exe
## @todo: install pyinstaller.py

## OllyDebug
wget http://www.ollydbg.de/odbg110.zip -o ollydbg.zip
unzip ollydbg.zip -d ollydbg/
wine ollydbg/OLLYDBG.EXE

## Immunity debugger is blocked by registration
## SHA256 hash was recorded from the official site
## A copy was found on github; that we can dl
## @todo install mona
hash='9c15cd47d018ccd99a6c8865baba20134c67061ae0e19232c32ecd0139ccfd42'
wget https://github.com/brianwrf/PriWebshell/blob/master/ImmunityDebugger_1_85_setup.exe?raw=true -o ImmunityDebugger.exe
ret_h=openssl sha256 ImmunityDebugger.exe
if [ "$hash" = "$ret_h" ]; then
  echo "Matching hashes for immunity debugger"
  wine ImmunityDebugger.exe
else
  shred -fuz ImmunityDebugger.exe
fi

## Prep Firefox
cd /root/Downloads/
wget https://addons.mozilla.org/firefox/downloads/file/969185/foxyproxy_standard-6.3-an+fx.xpi -O foxyproxy.xpi
firefox foxyproxy.xpi

# Change Root Password
pass1=h;pass2=p
until [ "$pass1" == "$pass2" ]; do
        read -p "Enter new password: " -s pass1
        echo
        read -p "Enter new password (again): " -s pass2
        echo
        if [ "$pass1" != "$pass2" ]; then
                echo "password token error, please try again"
        fi
done
echo "root:$pass1" | chpasswd
echo "Password updated"

# Regenerate SSH Keys
rm -v /etc/ssh/ssh_host_*
dpkg-reconfigure openssh-server

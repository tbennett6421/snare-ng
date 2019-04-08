#!/usr/bin/env bash

## Define VARS here
SHARE="vmshared"
WINEXEC="/windows/exec"

## Install additional tools
apt-get install htop gdebi w3m openssh-server -y
architecture=`uname -m`
arch=0
if [ $architecture == 'i686' ]; then
	arch=32
else
	arch=64
fi

## Begin
rm -rf /opt/build/ && mkdir -p /opt/build/

## Reconnoitre
mkdir -p /opt/build/Reconnoitre && cd /opt/build/Reconnoitre
git clone https://github.com/codingo/Reconnoitre.git .
python setup.py install

## VHostScan
mkdir -p /opt/build/vhostscan && cd /opt/build/vhostscan
git clone https://github.com/codingo/VHostScan.git .
python3 setup.py install

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
apt-get install gdebi -y
mkdir -p /opt/build/vscode && cd /opt/build/vscode
if [ $arch -eq 32 ]; then
	url=https://go.microsoft.com/fwlink/?LinkID=760680
else
	url=https://go.microsoft.com/fwlink/?LinkID=760868
fi
wget "$url" -O vscode.deb
yes | gdebi vscode.deb

## Install debugging/emulation tools
## mingw-w64 provides windows build environment including cross compilers
apt-get install mingw-w64 wine -y
wine -i > /dev/null 2>&1
cd /root/.wine/drive_c/users/root/Downloads/
# setup python for windows
wget https://www.python.org/ftp/python/3.7.3/python-3.7.3.exe
wget https://www.python.org/ftp/python/2.7.16/python-2.7.16.msi
echo "[*] Use the defaults as the script will symlink everything to a more convenient location"
echo "[*] Install #1 is python3, be sure to install to C:\Python3"
read -n 1 -s -r -p "Press any key to continue"
wine python-3.7.3.exe 
msiexec /i python-2.7.16.msi
wine /root/.wine/drive_c/Python3/Scripts/pip.exe install pyinstaller

## OllyDebug
mkdir -p /opt/build/ollydbg && cd /opt/build/ollydbg
wget http://www.ollydbg.de/odbg110.zip -O ollydbg.zip
unzip ollydbg.zip

## Immunity debugger is blocked by registration
## SHA256 hash was recorded from the official site
## A copy was found on github; that we can dl
mkdir -p /opt/build/immunity-debugger && cd /opt/build/immunity-debugger
hash='9c15cd47d018ccd99a6c8865baba20134c67061ae0e19232c32ecd0139ccfd42'
wget "https://github.com/brianwrf/PriWebshell/blob/master/ImmunityDebugger_1_85_setup.exe?raw=true" -O ImmunityDebugger.exe
sha256sum ImmunityDebugger.exe | grep -o "$hash"
if [ $? = 0 ]; then
  echo "Matching hashes for immunity debugger"
  wine ImmunityDebugger.exe
else
  shred -fuz ImmunityDebugger.exe
fi
wget https://raw.githubusercontent.com/corelan/mona/master/mona.py -O "/root/.wine/drive_c/Program Files/Immunity Inc/Immunity Debugger/PyCommands/mona.py"

## Call mount folders
/usr/local/sbin/mount-shared-folders
ln -s /mnt/hgfs/$SHARE /root/Desktop/$SHARE

## Link files
ln -s /opt/build/Empire/empire /usr/local/bin/empire
ln -s /opt/build/ptf/ptf /usr/local/bin/ptf
ln -s /opt/build/gobuster/gobuster /usr/local/bin/gobuster
rm -rf "$WINEXEC" && mkdir -p "$WINEXEC"
ln -s /root/.wine/drive_c/Python27/python.exe "$WINEXEC/python2.exe"
ln -s /root/.wine/drive_c/Python3/python.exe "$WINEXEC/python3.exe"
ln -s /root/.wine/drive_c/Python3/Scripts/pip.exe "$WINEXEC/pip.exe"
ln -s /opt/build/ollydbg/OLLYDBG.EXE "$WINEXEC/ollydbg.exe"
ln -s "/root/.wine/drive_c/Program Files/Immunity Inc/Immunity Debugger/ImmunityDebugger.exe" "$WINEXEC/immunity-debugger.exe"

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

echo "#!/bin/bash" >> /etc/rc.local
echo "/usr/local/sbin/mount-shared-folders" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local
chmod +x /etc/rc.local

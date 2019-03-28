## Setup detached X11 screens
screen -S burp -d -m
screen -S firefox -d -m
screen -S immunity -d -m
screen -S wireshark -d -m
screen -S dirbuster -d -m

## Setup screen warnings
screen -S burp -p 0 -X stuff "PS1=$'\\[\E[31m\\]CAUTION: YOU ARE ATTACHED TO SCREEN \\[\E[36m\\]$STY\n\\[\E[1m\\]\\[\E[31m\\][\\[\E[33m\\]\\u\\[\E[32m\\]@\\[\E[34m\\]\\h \\[\E[35m\\]\\W\\[\E[31m\\]]\\[\E[37m\\]\\$ \\[\E(B\E[m\\]'^M"
screen -S firefox -p 0 -X stuff "PS1=$'\\[\E[31m\\]CAUTION: YOU ARE ATTACHED TO SCREEN \\[\E[36m\\]$STY\n\\[\E[1m\\]\\[\E[31m\\][\\[\E[33m\\]\\u\\[\E[32m\\]@\\[\E[34m\\]\\h \\[\E[35m\\]\\W\\[\E[31m\\]]\\[\E[37m\\]\\$ \\[\E(B\E[m\\]'^M"
screen -S immunity -p 0 -X stuff "PS1=$'\\[\E[31m\\]CAUTION: YOU ARE ATTACHED TO SCREEN \\[\E[36m\\]$STY\n\\[\E[1m\\]\\[\E[31m\\][\\[\E[33m\\]\\u\\[\E[32m\\]@\\[\E[34m\\]\\h \\[\E[35m\\]\\W\\[\E[31m\\]]\\[\E[37m\\]\\$ \\[\E(B\E[m\\]'^M"
screen -S wireshark -p 0 -X stuff "PS1=$'\\[\E[31m\\]CAUTION: YOU ARE ATTACHED TO SCREEN \\[\E[36m\\]$STY\n\\[\E[1m\\]\\[\E[31m\\][\\[\E[33m\\]\\u\\[\E[32m\\]@\\[\E[34m\\]\\h \\[\E[35m\\]\\W\\[\E[31m\\]]\\[\E[37m\\]\\$ \\[\E(B\E[m\\]'^M"
screen -S dirbuster -p 0 -X stuff "PS1=$'\\[\E[31m\\]CAUTION: YOU ARE ATTACHED TO SCREEN \\[\E[36m\\]$STY\n\\[\E[1m\\]\\[\E[31m\\][\\[\E[33m\\]\\u\\[\E[32m\\]@\\[\E[34m\\]\\h \\[\E[35m\\]\\W\\[\E[31m\\]]\\[\E[37m\\]\\$ \\[\E(B\E[m\\]'^M"

# send clear
screen -S burp -p 0 -X stuff "clear^M"
screen -S firefox -p 0 -X stuff "clear^M"
screen -S immunity -p 0 -X stuff "clear^M"
screen -S wireshark -p 0 -X stuff "clear^M"
screen -S dirbuster -p 0 -X stuff "clear^M"

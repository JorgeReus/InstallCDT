#!/bin/bash
dpkg --add-architecture i386
apt update
apt install libc6:i386 libncurses5:i386 libstdc++6:i386
apt install libxtst6:i386
apt install libxt6:i386
apt install libxi6:i386
apt install libgconf-2-4:i386
sh ./VP_Suite_Linux_3_3_20080707.sh
exit 0
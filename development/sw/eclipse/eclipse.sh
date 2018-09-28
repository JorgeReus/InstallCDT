#!/bin/bash
tar -zxf *.tar.gz
mv eclipse /opt
ln -s /opt/eclipse/eclipse /usr/bin/eclipse
desktop-file-install eclipse.desktop
rm -rf eclipse
exit 0

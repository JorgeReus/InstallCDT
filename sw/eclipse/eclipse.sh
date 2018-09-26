#!/usr/bin/bash
tar -zxf *.tar.gz
mv eclipse /opt
ln -s /opt/eclipse/eclipse /usr/bin/eclipse
desktop-file-install eclipse.desktop
exit 0

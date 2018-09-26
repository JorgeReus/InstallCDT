#!/usr/bin/bash
tar -zxf *.tar.gz
mv eclipse /opt
ln -s /opt/eclipse/eclipse /usr/bin/eclipse
desktop-file-install eclipse.desktop
rm -rf eclipse-java-oxygen-R-linux-gtk-x86_64
exit 0

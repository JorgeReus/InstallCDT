#!/usr/bin/bash
tar -zxf *.tar.gz
mv apache-tomcat-8.5.15 /opt
ln -s /opt/apache-tomcat-8.5.15/bin/startup.sh /usr/bin/startup-8.5
ln -s /opt/apache-tomcat-8.5.15/bin/shutdown.sh /usr/bin/shutdown-8.5
rm -rf apache-tomcat-8.5.15
exit 0
#!/bin/bash
tar -xvf *.tar.gz
mkdir /usr/local/java
mv jdk1.8.0_131/ /usr/local/java
update-alternatives --install /usr/bin/java java /usr/local/java/jdk1.8.0_131/bin/java 1099
update-alternatives --install /usr/bin/javac javac /usr/local/java/jdk1.8.0_131/bin/javac 1099
update-alternatives --install /usr/bin/jar jar /usr/local/java/jdk1.8.0_131/bin/jar 1099
update-alternatives --install /usr/bin/javaws javaws /usr/local/java/jdk1.8.0_131/bin/javaws 1099
update-alternatives --config java
exit 0

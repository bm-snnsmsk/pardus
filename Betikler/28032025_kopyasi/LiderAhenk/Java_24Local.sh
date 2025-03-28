#!/bin/bash

#sudo apt install openjdk-8-jre icedtea-netx wget2 -y

sudo apt install openjdk-8-jre icedtea-netx wget2 -y
wget2 http://10.47.242.23/mardin/java_24/jdk-24_linux-x64_bin.deb -P /tmp/
dpkg -i /tmp/jdk-24_linux-x64_bin.deb

#sudo update-alternatives --set java /usr/lib/jvm/jdk-24-oracle-x64/jre/bin/java       # jre dizini yok
sudo update-alternatives --set java /usr/lib/jvm/jdk-24-oracle-x64/bin/java 
sudo sed -i "s|JRE=|#JRE=|" /usr/share/icedtea-web/bin/javaws.sh
sudo echo 'JRE=/usr/lib/jvm/jdk-24-oracle-x64' >>  /usr/share/icedtea-web/bin/javaws.sh
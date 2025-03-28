#!/bin/bash
sudo apt install openjdk-8-jre icedtea-netx wget2 -y

#wget2 https://transfer.saglik.gov.tr/index.php/s/DQ2TgAk2Aff7XkC/download/oracle-java8-jre_8u431_amd64.deb -P /tmp/
wget2 http://10.47.242.23/mardin/java/oracle-java8-jre_8u431_amd64.deb -P /tmp/


dpkg -i /tmp/oracle-java8-jre_8u431_amd64.deb
sudo update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
sudo sed -i "s|JRE=|#JRE=|" /usr/share/icedtea-web/bin/javaws.sh
sudo echo 'JRE=/usr/lib/jvm/java-8-openjdk-amd64' >>  /usr/share/icedtea-web/bin/javaws.sh
#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo "root yetkisi ile çalıştırmalısınız.."
	exit 1
fi

sudo apt-get install openjdk-8-jre icedtea-netx -y

update-alternatives --set java /usr/lib/jvm/oracle-java8-jdk-amd64/jre/bin/java

sed -ie '4 a JRE=/usr/lib/jvm/java-8-openjdk-amd64' /usr/share/icedtea-web/bin/javaws.sh

cat /usr/share/icedtea-web/bin/javaws.sh

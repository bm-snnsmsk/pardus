#!/bin/bash

## chrome versionu
#google-chrome --version


VERSION_NAME="130.0.6723.58-1"


sudo apt remove google-chrome-stable -y

wget -O /tmp/ http://10.47.242.23/mardin/google_eski_versionlari/google-chrome-stable_${VERSION_NAME}_amd64.deb
cd /tmp/
sudo dpkg -i google-chrome-stable_${VERSION_NAME}_amd64.deb
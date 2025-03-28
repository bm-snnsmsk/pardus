#!/bin/bash

wget https://github.com/apple/cups/releases/tag/v2.3.6/cups-2.3.6.zip -P /tmp/
cd /tmp
unzip cups-2.3.6.zip


sudo dpkg -i /tmp/cups-2.3.6.deb
sudo apt -f install -y
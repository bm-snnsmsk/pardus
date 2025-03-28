#!/bin/bash

sudo apt install -y wget2

#wget2 https://transfer.saglik.gov.tr/index.php/s/rZHxPDi5BLa8fKJ/download/arksigner-pub-2.3.11.deb -P /tmp/
wget2 http://10.47.242.23/mardin/arksigner/arksigner-pub-2.3.11.deb -P /tmp/

sudo dpkg -i /tmp/arksigner-pub-2.3.11.deb
#!/bin/bash
# Sinan ŞİMŞEK  |  sinan.simsek3@saglik.gov.tr

KULLANICIADI=yerelkullanici
EVDIZINI=sinan

cp -rf /home/$EVDIZINI/Masaüstü/* /home/$KULLANICIADI/Desktop/
rm -r /home/$KULLANICIADI/Desktop/AKİS.desktop
cp -rf /home/$EVDIZINI/Masaüstü/Bağlantılar/AKİS.desktop /home/$KULLANICIADI/Desktop/AKİS.desktop

chown -R $KULLANICIADI:$KULLANICIADI /home/$KULLANICIADI/Desktop/*
chmod 777 -R  /home/$KULLANICIADI/Desktop/*

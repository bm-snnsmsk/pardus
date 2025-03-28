#!/bin/bash

user=$(users | awk '{print $1}')
kimlik="Sinan ŞİMŞEK & sinan.simsek3@saglik.gov.tr"
sure="20000"

sudo -u $user DISPLAY=:0 notify-send -i "/opt/saglik/ikon/sblogo.png" -t $sure "Mardin İl Sağlık Müdürlüğü" "Bilgisayarınız domaine alınıyor. Lütfen bekleyiniz. \n\n$kimlik"

#sudo sed -i "s|10.47.241.251|10.47.242.23|" /etc/apt/sources.list

#sudo sed -i "s|https://repo.liderahenk.org|http://10.47.242.23|" /etc/apt/sources.list
#sudo apt update

#sudo apt install ahenk -y

sudo systemctl stop ahenk.service
sudo python3 /usr/share/ahenk/ahenkd.py start 10.47.241.251 test_ldap_user secret

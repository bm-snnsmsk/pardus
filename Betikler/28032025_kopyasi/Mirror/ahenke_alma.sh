#!/bin/bash

user=$(users | awk '{print $1}')
kimlik="Sinan ŞİMŞEK & sinan.simsek3@saglik.gov.tr"
sure="20000"

sudo -u $user DISPLAY=:0 notify-send -i "/opt/saglik/ikon/sblogo.png" -t $sure "Mardin İl Sağlık Müdürlüğü" "Bilgisayarınız domaine alınıyor. Lütfen bekleyiniz. \n\n$kimlik"

sudo sed -i '/liderahenk/d' /etc/apt/sources.list
sudo wget https://repo.liderahenk.org/liderahenk-archive-keyring.asc && sudo apt-key add liderahenk-archive-keyring.asc &&  sudo rm li>
sudo sh -c 'echo "deb [arch=amd64] https://repo.liderahenk.org/liderahenk stable main" >> /etc/apt/sources.list'


sudo cp /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d/
sudo rm /etc/apt/trusted.gpg
sudo apt update

#sudo sed -i "s|10.47.241.251|10.47.242.23|" /etc/apt/sources.list
#sudo apt update

sudo apt install ahenk -y
sudo systemctl stop ahenk.service
sudo python3 /usr/share/ahenk/ahenkd.py start 10.47.241.251 test_ldap_user secret
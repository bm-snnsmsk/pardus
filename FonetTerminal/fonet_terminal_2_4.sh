#!/bin/bash
#HEM GOOGLE CHROME GÜNCELLELİYOR HEMDE TERMİNAL VERSİYONU DEĞİŞTİRİYOR
user=$(who |cut -d" " -f1)
rm /tmp/google-chrome-stable_current_amd64.deb
echo "google-chrome-stable install" | sudo dpkg --set-selections
#user=$(users | awk '{print $1}') denemek lazım
#user=$(getent passwd | grep 1000 | cut -d: -f1)
#getent passwd | grep 1000 | cut -d: -f1

sudo rm /home/$user/.config/autostart/Fonet*
sudo rm /etc/skel/.config/autostart/Fonet*
sudo rm /home/$user/Masaüstü/Fonet*
sudo rm /etc/skel/Masaüstü/Fonet*
sudo rm /usr/share/applications/Fonet*

sudo wget2 -O /opt/saglik/ikon/webterminal.png https://transfer.saglik.gov.tr/index.php/s/KfXALgxXkwFrKkN/download/webterminal.png
sudo wget2 -O /opt/saglik/ikon/fonet.png https://transfer.saglik.gov.tr/index.php/s/niB4pXnM6NPJL9c/download/fonet.png
kill -9 $(ps aux | grep FonetWebTerminal | awk '{print $2}')
cd /home/$user/
sudo apt install wget2 libu2f-udev -y
wget2 https://transfer.saglik.gov.tr/index.php/s/FfeQqSKHzQdEpj5/download/googlechrome124.tar.gz -P /tmp/
tar -zxvf  /tmp/googlechrome116.tar.gz -C /tmp/
dpkg -i  /tmp/google-chrome-stable_current_amd64.deb
echo "google-chrome-stable hold" | sudo dpkg --set-selections
sudo chmod 777 /home/$user/Masaüstü/google-chrome.desktop

sudo wget2 -O /etc/skel/FonetWebTerminal.jar https://transfer.saglik.gov.tr/index.php/s/KCNM79Gx2Fg8o9L/download/FonetWebTerminal-2.4.jar
sudo chmod 777 /etc/skel/FonetWebTerminal.jar

sudo wget2 -O /usr/share/applications/Fonet.desktop https://transfer.saglik.gov.tr/index.php/s/L7BNxNf334t5jEk/download/Fonet.desktop
sudo wget2 -O /usr/share/applications/FonetHBYS.desktop https://transfer.saglik.gov.tr/index.php/s/k2qDb3AJ6x295DP/download/FonetHBYS.desktop
sudo ln -s /usr/share/applications/Fonet.desktop /etc/skel/Masaüstü/
sudo ln -s /usr/share/applications/Fonet.desktop /home/$user/Masaüstü/
sudo ln -s /usr/share/applications/FonetHBYS.desktop /etc/skel/Masaüstü/
sudo ln -s /usr/share/applications/FonetHBYS.desktop /home/$user/Masaüstü/
sudo ln -s /usr/share/applications/Fonet.desktop /etc/xdg/autostart/
sudo ln -s /usr/share/applications/FonetHBYS.desktop /etc/xdg/autostart/
sudo sed -i "s|hbys.aydinism|fonethbys.mardin.ism|" /usr/share/applications/FonetHBYS.desktop
sudo chmod 777 /home/$user/Masaüstü/Fonet*
sudo chmod 777 /etc/skel/Masaüstü/Fonet*
sudo systemctl restart arksignerd.service
sudo service lightdm restart
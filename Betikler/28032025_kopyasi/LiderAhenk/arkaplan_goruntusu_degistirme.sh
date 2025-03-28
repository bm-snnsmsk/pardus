#!/bin/bash

sudo sed -i -e 's/depo.pardus.org.tr/10.47.241.251/' /etc/apt/sources.list
sudo apt update
sudo sed -i 's|Aydın İl Sağlık Müdürlüğü|Mardin İl Sağlık Müdürlüğü|' /opt/saglik/dosya/aydo.html
sudo sed -i 's|Aydoğan Dikici|Bilgi İşlem Birimi|' /opt/saglik/dosya/aydo.html
sudo sed -i 's|2023|2024|' /opt/saglik/dosya/aydo.html
sudo sed -i 's|Aydın KDCH|Sağlık Bakanlığı|' /opt/saglik/dosya/aydo.html
sudo wget2  https://transfer.saglik.gov.tr/index.php/s/DSLsG46EXP3waM7/download/hbys_temizlemeAKDCH.desktop -P /usr/share/applications/
sudo ln -s /usr/share/applications/hbys_temizlemeAKDCH.desktop /etc/skel/Masaüstü/

# /home dizinindeki tüm kullanıcıların masaüstü dizinlerine kısayol oluştur
for kullanici_dizini in /home/*/; do
    # Kullanıcı adı
    kullanici=$(basename "$kullanici_dizini")
    
    # Masaüstü dizini
    masaustu_dizini="$kullanici_dizini/Masaüstü"

    # Eğer masaüstü dizini varsa
    if [ -d "$masaustu_dizini" ]; then
        ln -s /usr/share/applications/hbys_temizlemeAKDCH.desktop "$masaustu_dizini/hbys_temizlemeAKDCH.desktop"
        chown "$kullanici:$kullanici" "$masaustu_dizini/hbys_temizlemeAKDCH.desktop"
    fi
done

sudo sed -i -e 's|Pardus|Mardinism|' /etc/xdg/pardus/xfce4/whiskermenu/defaults.rc
sudo wget -O /usr/share/backgrounds/bayrak.jpg https://transfer.saglik.gov.tr/index.php/s/8HCSwBTm7WHE6D3/download/mardinism.jpeg
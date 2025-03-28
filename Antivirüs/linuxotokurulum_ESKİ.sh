#!/bin/bash
# Basit bir Bash Script
# Hazırlayan BİLİŞİM TEKNİK DESTEK BİRİMİ

echo "MERHABALAR ANTİVİRÜS KURULUMUNA HOŞ GELDİNİZ."

if [ $(id -u) -ne 0 ]; then
    echo "root Yetkisi ile Çalıştırmalısınız."
    exit 1
fi
apt-get update

## UNRAR KURULUMU
if dpkg -l | grep unrar > /dev/null ; then
  	  echo "Zaten kurulu"
else
 	   apt install unrar -y
fi

# PAKETLERİN İNDİRİLMESİ
wget https://transfer.saglik.gov.tr/index.php/s/FqjBwKXCoa7fes3/download/klnagent64_15.0.0-12912_amd64.rar
wget https://transfer.saglik.gov.tr/index.php/s/MG9cHMMgmdbEqxE/download/KasperskyLinuxEndpointKorumaMotoru12.6672.rar
wget https://transfer.saglik.gov.tr/index.php/s/oia7f8iwaHPzmCY/download/KasperskyEndpointArayuzGUI.rar

## RARDAN ÇIKARMA İŞLEMİ

chmod 777 klnagent64_15.0.0-12912_amd64.rar KasperskyLinuxEndpointKorumaMotoru12.6672.rar KasperskyEndpointArayuzGUI.rar

unrar e klnagent64_15.0.0-12912_amd64.rar
unrar e KasperskyLinuxEndpointKorumaMotoru12.6672.rar
unrar e KasperskyEndpointArayuzGUI.rar

chmod 777 klnagent64_15.0.0-12912_amd64.sh kesl-gui_12.0.0-6672.sh kesl-gui_12.0.0-6672_amd64.deb

## AJAN KURULUMU 

./klnagent64_15.0.0-12912_amd64.sh


##ENDPOİNT GUİ KURULUMU

./kesl-gui_12.0.0-6672.sh

##Endpoint Gui Kurulması

dpkg -i kesl-gui_12.0.0-6672_amd64.deb

##ENDPOİNT GUİ KURULUMU

./kesl-gui_12.0.0-6672.sh

##Endpoint Gui Kurulması

dpkg -i kesl-gui_12.0.0-6672_amd64.deb

##İNDİRİLEN DOSYALARIN KALDIRILMASI

rm -rf klnagent64_15.0.0-12912_amd64.rar KasperskyLinuxEndpointKorumaMotoru12.6672.rar KasperskyEndpointArayuzGUI.rar klnagent64_15.0.0-12912_amd64.sh kesl-gui_12.0.0-6672.sh kesl-gui_12.0.0-6672_amd64.deb

#AJANIN TETİKLENMESİ

cd /opt/kaspersky/klnagent64/bin/
./klnagchk

echo "KASPERSKY ANTİVİRÜS KURULUMU BİTMİŞTİR."
echo "İYİ ÇALIŞMALAR DİLERİM."
echo "SAĞLIK BAKANLIĞI"
echo "BİLİŞİM TEKNİK DESTEK BİRİMİ"


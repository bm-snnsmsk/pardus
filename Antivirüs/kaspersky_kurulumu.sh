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
wget https://transfer.saglik.gov.tr/index.php/s/qtt7BDXqLDfMH58/download/klnagent64_15.1.0-20748_amd64.sh
wget https://transfer.saglik.gov.tr/index.php/s/gHWMCs3wqdy9KX3/download/kesl-gui_12.2.0-2412_amd64.deb
wget https://transfer.saglik.gov.tr/index.php/s/GjMCmY7psxW8GXz/download/kesl_12.2.0-2412_amd64.deb

## YETKİ VERME

chmod 777 klnagent64_15.1.0-20748_amd64.sh kesl-gui_12.2.0-2412_amd64.deb kesl_12.2.0-2412_amd64.deb

## AJAN KURULUMU 

./klnagent64_15.1.0-20748_amd64.sh

##ENDPOİNT GUİ KURULUMU

dpkg -i kesl-gui_12.2.0-2412_amd64.deb
apt install -f       # bağımlılıkların yüklenmesi

##Endpoint Gui Kurulması

dpkg -i kesl_12.2.0-2412_amd64.deb

##İNDİRİLEN DOSYALARIN KALDIRILMASI

rm -rf klnagent64_15.1.0-20748_amd64.sh kesl-gui_12.2.0-2412_amd64.deb kesl_12.2.0-2412_amd64.deb

#AJANIN TETİKLENMESİ

cd /opt/kaspersky/klnagent64/bin/
./klnagchk

echo "KASPERSKY ANTİVİRÜS KURULUMU BİTMİŞTİR."
echo "İYİ ÇALIŞMALAR DİLERİM."
echo "SAĞLIK BAKANLIĞI"
echo "BİLİŞİM TEKNİK DESTEK BİRİMİ"

sudo reboot

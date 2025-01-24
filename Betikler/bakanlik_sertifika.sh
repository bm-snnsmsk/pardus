#!/bin/bash

user=$(who |cut -d" " -f1)
sudo rm -rf /home/$user/sbassl.crt
sudo rm -rf /home/$user/sbassl-ca.crt
#wget http://10.59.5.42/isokur/pardus/diger/cert/sbassl.der -P /home/$user/
#openssl x509 -inform DER -outform PEM -in sbassl.der -out sbassl.crt
wget https://transfer.saglik.gov.tr/index.php/s/HTzTJyJFqYGsk5Y/download/sbassl.crt -P /home/$user/
wget https://transfer.saglik.gov.tr/index.php/s/2BTPZNnRRFrjy8y/download/sbassl-ca.crt -P /home/$user/
sudo mv sbassl.crt /usr/local/share/ca-certificates/.
sudo mv sbassl-ca.crt /usr/local/share/ca-certificates/.
sudo update-ca-certificates

profil=$(find /home/$user/.mozilla/firefox -maxdepth 1 -type d -name "*.default")
profil2=$(find /home/$user/.mozilla/firefox -maxdepth 1 -type d -name "*.default-esr")
sudo apt install libnss3-tools curl -y
#certutil -A -d $profil -n "sbassl.der" -t "TC,,"
certutil -A -d $profil -n "sbassl" -t "C,," -i /home/$user/sbassl.crt
certutil -A -d $profil2 -n "sbassl" -t "C,," -i /home/$user/sbassl.crt
certutil -A -d $profil -n "sba-ca" -t "C,," -i /home/$user/sbassl-ca.crt
certutil -A -d $profil2 -n "sba-ca" -t "C,," -i /home/$user/sbassl-ca.crt


sudo mkdir /etc/skel/.pki
sudo mkdir /etc/skel/.pki/nssdb
mkdir /home/$user/.pki
mkdir /home/$user/.pki/nssdb

curl -k -o "sbassl.crt" "https://transfer.saglik.gov.tr/index.php/s/HTzTJyJFqYGsk5Y/download/sbassl.crt"
certutil -d sql:/home/$user/.pki/nssdb -A -t TC -n "https://transfer.saglik.gov.tr/index.php/s/HTzTJyJFqYGsk5Y/download" -i sbassl.crt
sudo certutil -d sql:/etc/skel/.pki/nssdb -A -t TC -n "https://transfer.saglik.gov.tr/index.php/s/HTzTJyJFqYGsk5Y/download" -i sbassl.crt

curl -k -o "sbassl-ca.crt" "https://transfer.saglik.gov.tr/index.php/s/2BTPZNnRRFrjy8y/download/sbassl-ca.crt"
certutil -d sql:/home/$user/.pki/nssdb -A -t TC -n "https://transfer.saglik.gov.tr/index.php/s/2BTPZNnRRFrjy8y/download/" -i sbassl-ca.crt
sudo certutil -d sql:/etc/skel/.pki/nssdb -A -t TC -n "https://transfer.saglik.gov.tr/index.php/s/2BTPZNnRRFrjy8y/download/" -i sbassl-ca.crt
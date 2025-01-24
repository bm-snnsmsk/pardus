#!/bin/bash

sudo DEBIAN_FRONTEND=noninteractive apt install -y ntpsec ntpdate
sudo sed -i -e 's/pool 0.debian.pool.ntp.org iburst/#pool 0.debian.pool.ntp.org iburst/' /etc/ntpsec/ntp.conf
sudo sed -i -e 's/pool 1.debian.pool.ntp.org iburst/#pool 1.debian.pool.ntp.org iburst/' /etc/ntpsec/ntp.conf
sudo sed -i -e 's/pool 2.debian.pool.ntp.org iburst/#pool 2.debian.pool.ntp.org iburst/' /etc/ntpsec/ntp.conf
sudo sed -i -e 's/pool 3.debian.pool.ntp.org iburst/#pool 3.debian.pool.ntp.org iburst/' /etc/ntpsec/ntp.conf
sudo sed -i '/^server 1/d' /etc/ntpsec/ntp.conf
sudo sh -c 'echo "server 10.47.241.251 prefer iburst" >> /etc/ntpsec/ntp.conf'
sudo timedatectl set-timezone Europe/Istanbul
sudo ntpdate 10.47.241.251
#sudo timedatectl set-ntp true
#sudo timedatectl set-time $(date +"%Y-%m-%d %H:%M:%S")
sudo systemctl restart ntpsec.service
systemctl restart ntpsec
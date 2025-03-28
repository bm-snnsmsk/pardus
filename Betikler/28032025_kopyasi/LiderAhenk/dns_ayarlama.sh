#!/bin/bash

sudo sed -i '/dns-nameservers/d' /etc/network/interfaces
echo 'dns-nameservers 10.47.48.4 10.47.240.5 10.47.48.9 172.18.111.111 172.18.111.112' >> /etc/network/interfaces
echo 'nameserver 10.47.48.4
nameserver 10.47.240.5
nameserver 172.18.111.111
nameserver 172.18.111.112' > /etc/resolv.conf
sudo chattr +i /etc/resolv.conf
sudo reboot
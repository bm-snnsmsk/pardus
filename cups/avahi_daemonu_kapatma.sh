#!/bin/bash

#systemctl list-units | grep avahi


#sudo systemctl status avahi-daemon.service
#sudo systemctl status avahi-daemon.socket

sudo systemctl stop avahi-daemon.service
sudo systemctl disable avahi-daemon.service
sudo systemctl mask avahi-daemon.service


sudo systemctl stop avahi-daemon.socket
sudo systemctl disable avahi-daemon.socket
sudo systemctl mask avahi-daemon.socket


sudo sed -i -e 's|Browsing Yes|Browsing Off|' /etc/cups/cupsd.conf
sudo sed -i -e 's|BrowseLocalProtocols dnssd|BrowseLocalProtocols none|' /etc/cups/cupsd.conf

## bu kod eklenmeden de çalıştığı test edildi...
#sudo sed -i -e 's|files mdns4_minimal [NOTFOUND=return] dns|files dns|' /etc/nsswitch.conf

sudo systemctl restart cups





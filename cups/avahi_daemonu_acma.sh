#!/bin/bash

#systemctl list-units | grep avahi
#sudo systemctl status avahi-daemon.service
#sudo systemctl status avahi-daemon.socket

sudo sed -i -e 's|Browsing Off|Browsing Yes|' /etc/cups/cupsd.conf
sudo sed -i -e 's|BrowseLocalProtocols none|BrowseLocalProtocols dnssd|' /etc/cups/cupsd.conf

sudo systemctl unmask avahi-daemon.socket
sudo systemctl unmask avahi-daemon.service

sudo systemctl enable avahi-daemon.socket
sudo systemctl enable avahi-daemon.service

sudo systemctl restart avahi-daemon.socket
sudo systemctl restart avahi-daemon.service

sudo systemctl restart cups



## bu kod eklenmeden de çalıştığı test edildi...
#sudo sed -i -e 's|files dns|files mdns4_minimal [NOTFOUND=return] dns|' /etc/nsswitch.conf


##############################################################################################################

### alternatif yol
#sudo systemctl disable --now cups-browsed

#tekrardan açmak için

#sudo systemctl enable --now cups-browsed
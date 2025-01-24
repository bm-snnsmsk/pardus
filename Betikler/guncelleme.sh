#!/bin/bash

echo "if [ -f /tmp/ahenk_update.sh ]; then rm /tmp/ahenk_update.sh; fi" >> /tmp/ahenk_update.sh

# create ahenk_update.sh file
echo "rm /etc/cron.d/ahenk_cron" >> /tmp/ahenk_update.sh
echo "systemctl restart cron.service"  >> /tmp/ahenk_update.sh
echo "systemctl restart ahenk.service" >> /tmp/ahenk_update.sh
echo "sudo apt update -y" >> /tmp/ahenk_update.sh
echo "sudo apt install ahenk -y" >> /tmp/ahenk_update.sh
echo "dpkg --configure -a" >> /tmp/ahenk_update.sh
echo "apt -f install -y" >> /tmp/ahenk_update.sh
echo "apt install ahenk -y" >> /tmp/ahenk_update.sh
echo "sudo rm /etc/apt/sources.list.d/zabbix.list.save" >> /tmp/ahenk_update.sh
echo "sudo rm /etc/apt/sources.list.d/google-chrome.list.save" >> /tmp/ahenk_update.sh
#echo "apt --yes --force-yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" full-upgrade" >> /tmp/ahenk_update.sh
echo "sudo DEBIAN_FRONTEND=noninteractive apt -yq -o Dpkg::Options::="--force-confnew" full-upgrade" >> /tmp/ahenk_update.sh
#echo "apt full-upgrade -yq" >> /tmp/ahenk_update.sh
echo "apt autoremove -y" >> /tmp/ahenk_update.sh
echo "rm /tmp/ahenk_update.sh" >> /tmp/ahenk_update.sh

# create ahenk_cron file for updated ahenk package
echo "*/1 * * * * root /bin/bash /tmp/ahenk_update.sh" > /etc/cron.d/ahenk_cron
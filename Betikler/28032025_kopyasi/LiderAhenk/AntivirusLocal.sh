#!/bin/bash

echo "if [ -f /tmp/ahenk_update.sh ]; then rm /tmp/ahenk_update.sh; fi" >> /tmp/ahenk_update.sh

# create ahenk_update.sh file
echo "rm /etc/cron.d/ahenk_cron" >> /tmp/ahenk_update.sh
echo "systemctl restart cron.service"  >> /tmp/ahenk_update.sh

#echo "wget -O /tmp/kaspersky_kurulumu.sh https://transfer.saglik.gov.tr/index.php/s/9oy4yxsf4daMNAz/download/kaspersky_kurulumu.sh" >> /tmp/ahenk_update.sh
echo "wget -O /tmp/kaspersky_kurulumu.sh http://10.47.242.23/mardin/antivirus/kaspersky_kurulumu.sh" >> /tmp/ahenk_update.sh

echo "sudo sh /tmp/kaspersky_kurulumu.sh" >> /tmp/ahenk_update.sh
echo "rm /tmp/ahenk_update.sh" >> /tmp/ahenk_update.sh

# create ahenk_cron file for updated ahenk package
echo "*/1 * * * * root /bin/bash /tmp/ahenk_update.sh" > /etc/cron.d/ahenk_cron

 

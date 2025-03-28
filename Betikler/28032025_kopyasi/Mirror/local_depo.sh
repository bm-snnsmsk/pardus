#!/bin/bash

#sudo sed -i -e 's|10.47.241.251/pardus|depo.pardus.org.tr/pardus|' /etc/apt/sources.list
#sudo sed -i -e 's|10.47.241.251/guvenlik|depo.pardus.org.tr/guvenlik|' /etc/apt/sources.list
#sudo sed -i -e 's|10.47.241.251/liderahenk|repo.liderahenk.org/liderahenk|' /etc/apt/sources.list

sudo sed -i -e 's|depo.pardus.org.tr|10.47.242.23|' /etc/apt/sources.list
#sudo sed -i -e 's|repo.liderahenk.org|10.47.242.23|' /etc/apt/sources.list
sudo sed -i -e 's|https://repo.liderahenk.org|http://10.47.242.23|' /etc/apt/sources.list
sudo apt update
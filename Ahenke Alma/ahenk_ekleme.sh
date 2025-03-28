#!/bin/bash

sudo sed -i "s|10.47.241.251|10.47.242.23|" /etc/apt/sources.list
sudo apt update
sudo systemctl stop ahenk.service
sudo python3 /usr/share/ahenk/ahenkd.py start 10.47.241.251 test_ldap_user secret
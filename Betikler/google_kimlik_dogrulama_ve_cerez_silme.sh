#!/bin/bash

user=$(who |cut -d" " -f1)

pkill -u $user chrome
sudo rm -r /home/$user/.config/google-chrome
sudo rm -r /home/$user/.cache/google-chrome

# keyring - kimlik doğrulama isterse
#sudo apt purge gnome-keyring -y

# 2. çözüm işe yaramazsa
#sudo rm -f /usr/share/keyrings/*
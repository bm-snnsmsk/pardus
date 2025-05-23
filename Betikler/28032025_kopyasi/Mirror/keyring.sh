#!/bin/bash

sudo sed -i '/liderahenk/d' /etc/apt/sources.list
sudo wget https://repo.liderahenk.org/liderahenk-archive-keyring.asc && sudo apt-key add liderahenk-archive-keyring.asc &&  sudo rm liderahenk-archive-keyring.asc
sudo sh -c 'echo "deb [arch=amd64] https://repo.liderahenk.org/liderahenk stable main" >> /etc/apt/sources.list'

sudo cp /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d/
sudo rm /etc/apt/trusted.gpg
sudo apt update
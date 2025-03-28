#!/bin/bash

sudo sed -i "s|https://repo.liderahenk.org|http://10.47.242.23|" /etc/apt/sources.list
sudo apt update
#!/bin/bash

# ensure running as root
cd ~
# remove some apk
sudo apt-get remove --purge -y firefox*
sudo apt-get remove --purge -y thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjongg aisleriot gnome-mines cheese transmission-common gnome-orca gnome-sudoku libreoffice-common deja-dup
sudo apt-get autoremove

# update & upgrade
sudo apt update
sudo apt list --upgradable
sudo apt upgrade -y

# install git and wget
sudo apt install -y git wget build-essential apt-transport-https ca-certificates curl gnupg lsb-release 
# install neofetch
sudo apt-get install -y neofetch

#install docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo wget -qO- https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor > docker-archive-keyring.gpg
sudo install -o root -g root -m 644 docker-archive-keyring.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
rm -f docker-archive-keyring.gpg
sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose

neofetch


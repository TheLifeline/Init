#!/bin/bash

echo "Please enter your sudo Password. >"
read -r sudopw

# ensure running as root
cd ~
# remove some apk
echo "&sudopw" | sudo -S apt-get remove --purge -y  firefox* thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjongg aisleriot gnome-mines cheese transmission-common gnome-orca gnome-sudoku libreoffice-common deja-dup
echo "&sudopw" | sudo -S apt-get autoremove

# update & upgrade
echo "&sudopw" | sudo -S apt update
echo "&sudopw" | sudo -S apt upgrade -y

# install git and wget
echo "&sudopw" | sudo -S apt install -y git wget build-essential apt-transport-https ca-certificates curl gnupg lsb-release neofetch

#install docker
echo "&sudopw" | sudo -S apt-get remove docker docker-engine docker.io containerd runc
echo "&sudopw" | sudo -S sh -c 'wget -qO- https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor > docker-archive-keyring.gpg'
echo "&sudopw" | sudo -S install -o root -g root -m 644 docker-archive-keyring.gpg /etc/apt/trusted.gpg.d/
echo "&sudopw" | sudo -S sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null'
echo "&sudopw" | sudo -S sh -c 'rm -f docker-archive-keyring.gpg'
echo "&sudopw" | sudo -S apt-get update 
echo "&sudopw" | sudo -S apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose

echo "&sudopw" | sudo -S groupadd docker
echo "&sudopw" | sudo -S usermod -aG docker $USER
newgrp docker 
echo "&sudopw" | sudo -S systemctl enable docker.service
echo "&sudopw" | sudo -S systemctl enable containerd.service

neofetch

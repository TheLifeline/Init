#!/bin/bash

echo "Please enter your sudo Password. >"
read -r sudopw

echo "$sudopw"
# remove some apk
echo "$sudopw" | sudo -S yum update
echo "$sudopw" | sudo -S yum upgrade -y

echo "$sudopw" | sudo -S yum install -y git wget build-essential apt-transport-https ca-certificates curl gnupg lsb-release neofetch

echo "$sudopw" | sudo -S yum install -y java-1.8.0-openjdk

echo "$sudopw" | sudo -S yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
echo "$sudopw" | sudo -S yum install -y yum-utils
echo "$sudopw" | sudo -S yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
echo "$sudopw" | sudo -S yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "$sudopw" | sudo -S groupadd docker
echo "$sudopw" | sudo -S usermod -aG docker $USER
newgrp docker

echo "$sudopw" | sudo -S systemctl enable docker.service
echo "$sudopw" | sudo -S systemctl enable containerd.service
echo "$sudopw" | sudo -S systemctl start docker
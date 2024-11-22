#!/bin/sh
passwd root<<EOF
password
password
EOF
rm /etc/ssh/sshd_config.d/*
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config.d/60-my-cloudimg-settings.conf
# sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
# sed -i -e 's/.*;exit 142" \(.*$\)/\1/' /root/.ssh/authorized_keys
service sshd restart

passwd ubuntu<<EOF
password
password
EOF
passwd centos<<EOF
password
password
EOF

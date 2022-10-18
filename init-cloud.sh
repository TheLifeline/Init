#!/bin/sh
passwd ubuntu<<EOF
password
password
EOF
passwd centos<<EOF
password
password
EOF
passwd root<<EOF
password
password
EOF
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
# sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
# sed -i -e 's/.*;exit 142" \(.*$\)/\1/' /root/.ssh/authorized_keys

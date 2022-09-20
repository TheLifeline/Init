#!/bin/sh
passwd ubuntu<<EOF
ubuntu
ubuntu
EOF
echo "PermitRootLogin yes" > /etc/ssh/sshd_config.d/my.config
# sed -i -e 's/.*exit 142" \(.*$\)/\1/' /root/.ssh/authorized_keys

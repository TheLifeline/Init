#!/bin/sh
passwd ubuntu<<EOF
ubuntu
ubuntu
EOF
echo "PermitRootLogin yes" > /etc/ssh/sshd_config.d/my.config

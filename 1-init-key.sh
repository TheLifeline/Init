ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa -q
cat ~/.ssh/id_rsa >> ~/key.pem
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
echo "Please enter your sudo Password. >"
read -r sudopw
echo "&sudop" | sudo -S sh -c "cp /etc/ssh/sshd_config /etc/ssh/sshd_config.ucf-old"
echo "&sudop" | sudo -S sh -c 'sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/g"  /etc/ssh/sshd_config'
echo "&sudop" | sudo -S sh -c 'echo "
RSAAuthentication yes
PubkeyAuthentication yes
PasswordAuthentication no
PrintMotd yes
" >> /etc/ssh/sshd_config.d/my.config'
echo "&sudop" | sudo -S sh -c 'service sshd restart'

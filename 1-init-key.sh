ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa -q
cat ~/.ssh/id_rsa > ~/key.pem
cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
echo "Please enter your sudo Password. >"
read -r sudopw
echo "&sudopw" | sudo -S sh -c "cp /etc/ssh/sshd_config /etc/ssh/sshd_config.ucf-old"
echo "&sudopw" | sudo -S sh -c 'sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/g"  /etc/ssh/sshd_config'
echo "&sudopw" | sudo -S sh -c 'echo "
RSAAuthentication yes
PubkeyAuthentication yes
PasswordAuthentication no
PrintMotd yes
" > /etc/ssh/sshd_config.d/my.conf'
echo "&sudopw" | sudo -S sh -c 'service sshd restart'

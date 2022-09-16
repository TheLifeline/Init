ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa -q
cat ~/.ssh/id_rsa >> ~/key.pem
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.ucf-old 
sudo sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/g"  /etc/ssh/sshd_config
sudo sh -c 'echo "
RSAAuthentication yes
PubkeyAuthentication yes
PasswordAuthentication no
PrintMotd yes
" >> /etc/ssh/sshd_config.d/my.config'
sudo service sshd restart
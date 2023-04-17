#!/bin/bash
# based on the provsioner.sh.master file
# node apps server build only
#VAGRANT_HOST_DIR=/mnt/host_machine
VAGRANT_HOST_DIR=/vagrant_data

########################
# Node & npm
########################
echo "Installing Node & npm"
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get -y install nodejs
sudo apt-get -y install npm

########################
# Docker
########################
echo "Installing Docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce
sudo systemctl enable docker
sudo usermod -aG docker ${USER}
sudo usermod -aG docker jenkins
sudo usermod -aG docker ubuntu
sudo usermod -aG docker appuser
echo " install docker compose"
sudo apt-get install -y docker-compose
echo "Success"
########################
# nginx
########################
echo "Installing nginx"
sudo apt-get -y install nginx > /dev/null 2>&1
sudo service nginx start

#######################
echo "Installing openssh-server"
sudo apt-get update && apt-get -y install openssh-server 
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.org
sudo cp /vagrant_data/sshd_config /etc/ssh/sshd_config
echo "Restart the sshd deamon"
sudo systemctl restart ssh
########################
# Configuring nginx
########################
echo "Configuring nginx"
cd /etc/nginx/sites-available
sudo rm default ../sites-enabled/default
sudo cp $VAGRANT_HOST_DIR/VirtualHost/jenkins /etc/nginx/sites-available/
#sudo cp /mnt/host_machine/VirtualHost/jenkins /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/jenkins /etc/nginx/sites-enabled/
sudo service nginx restart
sudo service jenkins restart
echo "Success"

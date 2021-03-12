#!/bin/bash

sudo yum update -y
sudo yum install git -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
newgrp docker
sudo chkconfig docker on
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
git clone https://github.com/traveller-scientist/docker-website.git
cd docker-website
chmod +x setup.sh
chmod +x ssl_renew.sh
sudo reboot
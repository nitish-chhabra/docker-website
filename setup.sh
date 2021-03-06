#!/bin/bash

sudo yum update -y
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
newgrp docker
docker-compose up -d
echo "ServerName localhost" | sudo tee /etc/apache2/conf.d/fqdn
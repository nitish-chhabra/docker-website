#!/bin/bash

mkdir wordpress && cd wordpress
mkdir nginx-conf
sudo cp /home/ec2-user/docker-website/nginx.conf nginx-conf/nginx.conf
sudo curl -sSLo nginx-conf/options-ssl-nginx.conf https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf
cd ..
docker-compose up -d
sudo service crond start
(crontab -l 2>/dev/null; echo "0 12 * * * /home/ec2-user/docker-website/ssl_renew.sh >> /var/log/cron.log 2>&1") | crontab -
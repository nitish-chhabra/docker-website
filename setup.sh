#!/bin/bash

mkdir wordpress && cd wordpress
mkdir nginx-conf
cp ~/docker-website/nginx.conf nginx-conf/nginx.conf
docker-compose up -d
crontab -l > mycron
echo "0 12 * * * /home/sammy/wordpress/ssl_renew.sh >> /var/log/cron.log 2>&1" >> mycron
crontab mycron
rm mycron
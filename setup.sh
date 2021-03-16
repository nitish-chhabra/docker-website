#!/bin/bash
sudo mkdir nginx-conf -p
sudo mkdir wordpress -p
sudo curl -sSLo nginx-conf/options-ssl-nginx.conf https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf
docker-compose up -d
sleep 20
rm nginx-conf/nginx.conf
cp nginx.conf nginx-conf/
docker-compose stop webserver
docker-compose up -d --no-deps --build webserver
sudo service crond start
(crontab -l 2>/dev/null; echo "0 12 * * * /home/ec2-user/docker-website/ssl_renew.sh >> /var/log/cron.log 2>&1") | crontab -
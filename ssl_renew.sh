#!/bin/bash

COMPOSE="/usr/local/bin/docker-compose"

cd /home/ec2-user/docker-website/
$COMPOSE run certbot renew && $COMPOSE kill -s SIGHUP webserver
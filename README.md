# Wordpress Website using Docker and AWS EC2
This repository contains the docker-compose and setup files to get a wordpress website running in no time through an EC2 machine from AWS.  
This can also be from the Free-Tier of AWS machines.
It sets up the LEMP Stack with latest wordpress, MySQL 8 and phpMyAdmin along with Nginx Webserver.  
It also has automatic SSL certificate renewal through certbot.  
All these services are defined through their own docker containers defined in the docker-compose.yaml file.  
 
The first file to be used is the aws_start.sh file.  
The contents can be used as instance start script through user data on AWS console.  
This clones the repository and installs docker-compose.  
The user only needs to either add this to the start script or run the file manually.  

After this please update your own password values inside .env file.  
Please update your own websites domain name inside ~/docker-website/nginx.conf  
The exact line to be updated is: server_name munshi.ml www.munshi.ml;  
Please replace munshi with your own domain name.  
After both the above steps please execute:  
```console
foo@bar:~$ ./setup.sh
```
This creates the Nginx config and adds crons for certbot renewals and starts all docker containers.  
You would also need a static IP Address (Elastic IP) for your AWS Instance.  
This can be obtained from inside the AWS console.  
After the correct domain forwarding is setup from your domain manager,  
The wordpress docker website should be live.  

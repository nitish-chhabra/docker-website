# Wordpress Website using Docker and AWS EC2
This repository contains the docker-compose and setup files to get a wordpress website running in no time through an EC2 machine from AWS.  
This can also be from the Free-Tier of AWS machines.  
This repository will help even if you have no prior programming knowledge.  
You only need to know how to signup for a AWS Free-Tier account and follow very simple steps explained below.  
  
This sets up the LEMP Stack with the latest Wordpress, MySQL, phpMyAdmin and Nginx Webserver containers.  
The above stack is setup through docker containers using Alpine Linux images.  
These reduce the size of the containers greatly and improve performance.  
  
This repository also sets up automatic SSL certificate renewal through certbot.  
All these services are defined through their own docker containers defined in the docker-compose.yaml file.  
You only need to edit 1 file for your passwords and domain name and you are good to go.  
   
&nbsp;  
Setup Process:  
The first file you need to use is the aws_start.sh file.  
The contents of this file can be used as instance start script through user data on AWS instance console.  
This console is present inside the AWS Launch instance > Configure Instance setting. 
This clones this repository and installs docker-compose.  
You only need to either add this to the start script or run the contents manually from inside the instance.  

After this please update your own password values inside .env file.
You will need to connect to your instance for this.  
If you need help in this, you can refer to this page - [Connect to Instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstances.html)   
Also please update the DOMAIN_NAME constant in .env file to reflect your own domain name.  
You would also need a static IP Address (Elastic IP) for your AWS Instance.  
This can be obtained from inside the AWS console > Elastic IPs.  

After the above steps please re-direct your domain name from your domain manager to your elastic IP.  
You can also obtain a free domain from [Freenom.com](https://www.freenom.com/) if you don't already have one.  
After the correct domain forwarding is setup from your domain manager,  
please execute the below command from inside the EC2 Machine:  

```console
foo@bar:~$ docker-website/setup.sh
```

Ideally this step can also be added to the startup script but you need to update the .env values to your own values.  
Please run the command only after you have updated your passwords, domain name and email address inside the .env file.  

This runs all the required docker containers for Nginx, Wordpress, MySQL, phpMyAdmin and certbot.  
Initially it runs an nginx webserver without an SSL certificate and asks certbot service to fetch a certificate.  
After fetching the certificate the nginx config is updated to use this certificate and the webserver is restarted.  
It also adds crons for certbot renewals for updating SSL certificates. 
After you have run the above command, visit your domain name. You should see the setup page for wordpress.  

If you found this repository useful - please star the repository. It really helps.  
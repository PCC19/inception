#!/bin/bash
# Make updates and upgrades
apt-get upgrade && apt-get update

#Install some tools (vim wget openssl man)
apt-get install -y vim man wget

#Install php and libraries required by the other softwares
apt-get install -y php php-curl php-imagick php-xml php-zip php-xmlreader php-ssh2 php-gd php-fpm php-mysql php-mbstring

#Create website directory
mkdir -p /var/www/localhost

#Install wordpress
## dwnld tarball
wget --progress=bar:force:noscroll https://wordpress.org/latest.tar.gz
## extract tarball
tar -xf latest.tar.gz
## delete tarball
rm latest.tar.gz

## Move files to site directory
#mv wordpress/ var/www/localhost/wordpress

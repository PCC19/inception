# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install_wordpress.sh                               :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcunha <pcunha@student.42sp.org.br>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/05 19:39:43 by pcunha            #+#    #+#              #
#    Updated: 2022/05/07 19:23:29 by pcunha           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
# Make updates and upgrades
apt-get upgrade && apt-get update

#Install some tools (vim wget openssl man)
apt-get install -y vim man wget

#Install php and libraries required by the other softwares
apt-get install -y php php-curl php-imagick php-xml php-zip php-xmlreader php-ssh2 php-gd php-fpm php-mysql php-mbstring

# Para debub apenas !!!
apt-get install -y mariadb-server

#Create website directory
#mkdir -p /var/www/localhost

#Install wordpress
## dwnld tarball
wget --progress=bar:force:noscroll https://wordpress.org/latest.tar.gz
## extract tarball
tar -xf latest.tar.gz
## delete tarball
rm latest.tar.gz

## Move files to site directory
#mv wordpress/ var/www/localhost/wordpress

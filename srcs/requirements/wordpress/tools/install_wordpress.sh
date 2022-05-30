# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install_wordpress.sh                               :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcunha <pcunha@student.42sp.org.br>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/05 19:39:43 by pcunha            #+#    #+#              #
#    Updated: 2022/05/20 00:39:58 by pcunha           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
set -x
# Make updates and upgrades
apt-get upgrade && apt-get update

#Install some tools (vim wget openssl man)
apt-get install -y vim man wget mariadb-client

#Install php and libraries required by the other softwares
apt-get install -y php php-curl php-imagick php-xml php-zip php-xmlreader php-ssh2 php-gd php-fpm php-mysql php-mbstring

#Install Wordpress via CLI
# Install WP-CLI
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp 
chmod +x /usr/local/bin/wp

# Install Wordpress using WP-CLI
cd wordpress
wp core download --allow-root

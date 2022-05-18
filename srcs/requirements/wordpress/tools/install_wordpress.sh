# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install_wordpress.sh                               :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcunha <pcunha@student.42sp.org.br>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/05 19:39:43 by pcunha            #+#    #+#              #
#    Updated: 2022/05/18 18:10:44 by pcunha           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh
# Make updates and upgrades
apt-get upgrade && apt-get update

#Install some tools (vim wget openssl man)
apt-get install -y vim man wget

#Install php and libraries required by the other softwares
apt-get install -y php php-curl php-imagick php-xml php-zip php-xmlreader php-ssh2 php-gd php-fpm php-mysql php-mbstring

##Install wordpress
### dwnld tarball
#wget --progress=bar:force:noscroll https://wordpress.org/latest.tar.gz
### extract tarball
#tar -xf latest.tar.gz
### delete tarball
#rm latest.tar.gz

#Install Wordpress via CLI
# Install WP-CLI
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp 
chmod +x /usr/local/bin/wp

# Install Wordpress using WP-CLI
#wp core download --allow-root
#wp config create --dbname=$WP_DB_NAME --dbuser=$WP_DB_USER --dbpass=$WP_DB_PASSWORD \
#    --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
#wp core install --url=$DOMAIN_NAME/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_USER \
#    --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
#wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root
#wp theme install ryu --activate --allow-root


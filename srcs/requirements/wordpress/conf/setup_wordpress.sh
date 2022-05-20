#!/bin/bash
# Wordpress setup

# Config file so php-fpm listens to 0.0.0.0:9000 in order to accepet connections from nginx
cp /tmp/conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Creaates wp-config.php
# Change vars needed to access Mariadb
sed -i "s/aaa/$WP_DB_NAME/g" input
sed -i "s/bbb/$WP_DB_USER/g" input
sed -i "s/ccc/$WP_DB_PASSWORD/g" input
sed -i "s/ddd/$MYSQL_HOST/g" input

mv input ./wordpress/wp-config.php

#!/bin/bash
# Wordpress setup
#rm /var/www/localhost/wordpress/wp-config-sample.php
#cp /srcs/wp-config.php /var/www/localhost/wordpress/wp-config.php
echo "Wordpress setup"

sed -i "s/aaa/$WP_DB_NAME/g" input
sed -i "s/bbb/$WP_DB_USER/g" input
sed -i "s/ccc/$WP_DB_PASSWORD/g" input
sed -i "s/ddd/$MYSQL_HOST/g" input

mv input ./wordpress/wp-config.php

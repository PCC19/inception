# WORDPRESS DOCKERFILE
FROM debian:buster

# Copy scripts to inside container
COPY ./tools /tmp/tools/
COPY ./conf /tmp/conf/

# Cria diretorio de trabalho onde sera instalado o WP e compartilhado com o NGINX para servir o site
WORKDIR /var/www/html/

# Get Environmet variables from yml ("empty: values will be overriden)
ARG WP_DB_NAME empty
ARG WP_DB_USER empty
ARG WP_DB_PASSWORD empty
ARG MYSQL_HOST empty
ARG DOMAIN_NAME empty
ARG WP_TITLE empty
ARG WP_ADMIN empty
ARG WP_ADMIN_PASSEWORD empty
ARG WP_ADMIN_EMAIL empty
ARG WP_USER empty
ARG WP_PASSWORD empty

# Configuration for database access in wordpress
RUN mkdir -p /var/www/html/wordpress
RUN cp /tmp/conf/wp-config.php /var/www/html/wordpress/wp-config.php

# Execute installation script
RUN bash /tmp/tools/install_wordpress.sh

# Configure wordpress
# Config file so php-fpm listens to 0.0.0.0:9000 in order to accepet connections from nginx
RUN cp /tmp/conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
# WP user config is done trough sql file loading in MariaDB container (mariadb dockerfile)
#RUN bash /tmp/conf/setup_wordpress.sh

EXPOSE 9000
# start php7.3-fpm:
# Create necessary dir so php-fpm7.3 can start. With "service php-fpm7.3 start" this dir is automaticaly created
RUN mkdir -p /var/run/php/
CMD ["php-fpm7.3", "-F"]

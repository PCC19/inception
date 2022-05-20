# WORDPRESS DOCKERFILE
FROM debian:buster

# Copy scripts to inside container
COPY ./tools /tmp/tools/
COPY ./conf /tmp/conf/

# Creates workdir where WP will be installed and shared witn NGINX to serve the site
WORKDIR /var/www/html/

# Get Environmet variables from yml ("empty": values will be overriden)
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
RUN cp /tmp/conf/wp-config-template.php /var/www/html/input

# Execute installation script
RUN bash /tmp/tools/install_wordpress.sh

# Configure wordpress
# WP user config is done trough sql file loading in MariaDB container (mariadb dockerfile)
RUN bash /tmp/conf/setup_wordpress.sh

EXPOSE 9000
# start php7.3-fpm:
# Create necessary dir so php-fpm7.3 can start. With "service php-fpm7.3 start" this dir is automaticaly created
RUN mkdir -p /var/run/php/
CMD ["php-fpm7.3", "-F"]

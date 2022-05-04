# WORDPRESS DOCKERFILE
FROM debian:buster

# Copy scripts to inside container
COPY ./tools ./tools
COPY ./conf ./conf

# Execute installation script
RUN bash ./tools/install_wordpress.sh

# Configure database
RUN bash ./conf/setup_wordpress.sh

# start php7.3-fpm:

EXPOSE 9000

# WORDPRESS DOCKERFILE
FROM debian:buster

# Copy scripts to inside container
COPY ./tools /tmp/tools/
COPY ./conf /tmp/conf/

# Cria diretorio de trabalho onde sera instalado o WP e compartilhado com o NGINX para servir o site
WORKDIR /var/www/html/

# Execute installation script
RUN bash /tmp/tools/install_wordpress.sh

# Configure wordpress
# Config file so php-fpm listens to 0.0.0.0:9000 in order to accepet connections from nginx
RUN cp /tmp/conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
#RUN bash /tmp/conf/setup_wordpress.sh

# start php7.3-fpm:
#CMD ["service", "php7.3-fpm", "start"]
#CMD ["/bin/bash"]
RUN service php7.3-fpm start
CMD ["tail", "-f", "/dev/null"]
EXPOSE 9000

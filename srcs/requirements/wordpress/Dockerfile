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
#CMD ["service", "php7.3-fpm", "start"]
#CMD ["/bin/bash"]
RUN service php7.3-fpm start
CMD ["tail", "-f", "/dev/null"]
EXPOSE 9000

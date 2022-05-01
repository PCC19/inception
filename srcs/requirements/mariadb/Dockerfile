# MARIADB DOCKERFILE
FROM debian:buster

# Copy scripts to inside container
COPY ./tools ./tools
COPY ./conf ./conf

# Execute installation script
RUN bash ./tools/install_mariadb.sh

# Configure database
RUN bash ./conf/setup_mariadb.sh

# CMD
#CMD ["/usr/bin/mysqld_safe"]
# or
CMD ["service", "mysql", "start"]

EXPOSE 3306

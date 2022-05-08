# MARIADB DOCKERFILE
FROM debian:buster

# Copy scripts to inside container
COPY ./tools ./tools
COPY ./conf ./conf

# Execute installation script
RUN bash ./tools/install_mariadb.sh

# Configure database
#RUN bash ./conf/setup_mariadb.sh
RUN service mysql start && mysql < ./conf/setup.sql
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# CMD
#CMD ["/usr/bin/mysqld_safe"]
# or
#CMD ["service", "mysql", "start"]
CMD ["tail", "-f", "/dev/null"]
#CMD mysqld

EXPOSE 3306

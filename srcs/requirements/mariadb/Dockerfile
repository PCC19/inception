# MARIADB DOCKERFILE
FROM debian:buster

# Copy scripts to inside container
COPY ./tools ./tools
COPY ./conf ./conf

# Execute installation script
RUN bash ./tools/install_mariadb.sh

# Configure database
#RUN bash ./conf/setup_mariadb.sh
# This sql file will setup 2 database users (root and pcunha)
RUN service mysql start && mysql < ./conf/setup.sql
# This sql file will load a sample wp with wp user and password already conf'd
RUN service mysql start && mysql -u root -pimroot -D wordpress < ./conf/wp_pcunha_blog.sql
# This file will allow access to the database from outside the container
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# CMD
#CMD ["/usr/bin/mysqld_safe"]
# or
#CMD ["service", "mysql", "start"]
RUN service mysql start
CMD ["tail", "-f", "/dev/null"]
#CMD mysqld

EXPOSE 3306

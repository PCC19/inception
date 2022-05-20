# MARIADB DOCKERFILE
FROM debian:buster

# Copy scripts to inside container
COPY ./tools ./tools
COPY ./conf ./conf

# Execute installation script
RUN ./tools/install_mariadb.sh

# Get Environmet variables from yml ("empty: values will be overriden)
ARG	DB_ROOT	empty
ARG	DB_ROOT_PASSWORD empty
ARG	DB_USER empty
ARG	DB_USER_PASSWORD empty
ARG	DB_NAME empty

# Configure database
RUN ./conf/setup_mariadb.sh
# This sql file will setup 2 database users (root and pcunha)
RUN service mysql start && mysql < setup.sql
# This file will allow access to the database from outside the container
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306
# CMD
CMD ["mysqld"]
#CMD ["tail", "-f", "/dev/null"]
#CMD ["./conf/setup_mariadb.sh"]

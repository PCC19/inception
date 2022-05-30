# MARIADB DOCKERFILE
FROM debian:buster

# Copy scripts to inside container
COPY ./tools ./tools
COPY ./conf ./conf

# Execute installation script
RUN ./tools/install_mariadb.sh

# Get Environmet variables from yml ("empty: values will be overriden)
#ARG	DB_ROOT	empty
#ARG	DB_ROOT_PASSWORD empty
#ARG	DB_USER empty
#ARG	DB_USER_PASSWORD empty
#ARG	DB_NAME empty
#ARG MYSQL_HOST empty

# Configure database
#RUN ./conf/setup_mariadb.sh
# This sql file will setup 2 database users (root and db_user)
#RUN service mysql start && mysql < setup.sql
# This sql file will setup 2 users for wp (wp_root and pcunha)
#RUN service mysql start && mysql -u$DB_ROOT -p$DB_ROOT_PASSWORD -D$DB_NAME < /conf/wordpress.sql
# This file will allow access to the database from outside the container
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT ["/conf/setup_mariadb.sh"]
# Start Mariadb
CMD ["mysqld"]

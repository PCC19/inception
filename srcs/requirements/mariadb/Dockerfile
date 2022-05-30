# MARIADB DOCKERFILE
FROM debian:buster

# Copy scripts to inside container
COPY ./tools ./tools
COPY ./conf ./conf

# Execute installation script
RUN ./tools/install_mariadb.sh

EXPOSE 3306

ENTRYPOINT ["/conf/setup_mariadb.sh"]

# Start Mariadb
CMD ["mysqld"]

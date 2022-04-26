FROM debian:buster

# Copy scripts to inside container
COPY ./tools ./tools

# Execute installation script
RUN bash ./tools/install_mariadb.sh

# Configure database

EXPOSE 3306

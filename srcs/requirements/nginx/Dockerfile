FROM debian:buster

# Copy scripts to inside container
COPY ./tools ./tools
COPY ./conf ./conf

# Execute installation script
RUN bash ./tools/install_nginx.sh

# Execute setup script
RUN bash ./conf/setup_nginx.sh

EXPOSE 80 8080

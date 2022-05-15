# NGNIX DOCKERFILE
FROM debian:buster

# Copy scripts to inside container
COPY ./tools ./tools
COPY ./conf ./conf

# Execute installation script
RUN bash ./tools/install_nginx.sh

# Execute setup script
COPY ./conf/nginx.conf /etc/nginx/sites-available/default
RUN bash ./conf/setup_nginx.sh

EXPOSE 443

#CMD ["tail", "-f", "/dev/null"]
CMD ["nginx", "-g", "daemon off;"]

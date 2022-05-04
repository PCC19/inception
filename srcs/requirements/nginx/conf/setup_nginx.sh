#!/bin/bash


## Change owners and permissions
# chown -R www-data:www-data /var/www/*
# chmod -R 755 /var/www/*

# Setup do SSL (C=pais, ST=estado, L=localizacao O=organizacao CN=nome)
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj '/C=BR/ST=SP/L=SP/O=42SP/CN=pcunha' \
	-keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt


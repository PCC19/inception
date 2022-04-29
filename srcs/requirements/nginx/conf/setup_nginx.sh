#!/bin/bash

# Configure nginx
#cp /srcs/nginx.conf /etc/nginx/sites-available/default
## Change owners and permissions
# chown -R www-data:www-data /var/www/*
# chmod -R 755 /var/www/*

# Start nginx
service nginx start

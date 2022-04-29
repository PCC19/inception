#!/bin/bash

# Start mariadb
service mysql start

# Create user root with password imroot (localhost)
mysqladmin -u root -p password imroot flush-privileges
mysql -u root -p -e "CREATE USER 'root'@'%' IDENTIFIED BY 'imroot';"

# Create user root with password imroot (all hosts)



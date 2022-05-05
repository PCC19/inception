#!/bin/bash

# Start mariadb
service mysql start

# Create user root with password imroot (localhost)
mysqladmin -u root -p flush-privileges password "imroot"
mysql -u root -p -e "CREATE USER 'root'@'%' IDENTIFIED BY 'imroot';"

service mysql stop
# Create user root with password imroot (all hosts)



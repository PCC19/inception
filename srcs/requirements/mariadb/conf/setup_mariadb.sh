#!/bin/bash

# Start mariadb
service mysql start

# Create user root with password imroot (localhost)
mysqladmin -u root -p flush-privileges password "imroot"
mysql -u root -pimroot -e "grant usage on *.* to 'root'@'%' identified by 'imroot';"
mysql -u root -pimroot -e "grant all on *.* to 'root'@'%';"

service mysql stop
# Create user root with password imroot (all hosts)



#!/bin/sh
set -x

DB_PATH=/var/lib/mysql/${DB_NAME} 
if [ ! -d "$DB_PATH" ] 
then
	# This sql file will setup 2 database users (root and db_user)
	echo "grant all on *.* to '"${DB_ROOT}"'@'localhost' with grant option;" >> setup.sql
	echo "create user '"${DB_ROOT}"'@'%';" >> setup.sql
	echo "grant all on *.* to '"${DB_ROOT}"'@'%' with grant option;" >> setup.sql
	echo "SET PASSWORD FOR '"${DB_ROOT}"'@'localhost'=PASSWORD('"${DB_ROOT_PASSWORD}"');" >> setup.sql
	echo "SET PASSWORD FOR '"${DB_ROOT}"'@'%'=PASSWORD('"${DB_ROOT_PASSWORD}"');" >> setup.sql
	echo "FLUSH PRIVILEGES;" >> setup.sql
	echo  "\n" >> setup.sql
	echo "CREATE USER '"${DB_USER}"'@'localhost' IDENTIFIED BY '"${DB_USER_PASSWORD}"';" >> setup.sql
	echo "CREATE USER '"${DB_USER}"'@'%' IDENTIFIED BY '"${DB_USER_PASSWORD}"';" >> setup.sql
	echo "GRANT ALL PRIVILEGES ON *.* TO '"${DB_USER}"'@'localhost';" >> setup.sql
	echo "GRANT ALL PRIVILEGES ON *.* TO '"${DB_USER}"'@'%';" >> setup.sql
	echo "FLUSH PRIVILEGES;" >> setup.sql
	echo  "\n" >> setup.sql
	echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" >> setup.sql

	# This sql file will setup 2 users for wp (wp_root and pcunha)
	service mysql start && mysql < setup.sql

	# This file will allow access to the database from outside the container
	service mysql start && mysql -u$DB_ROOT -p$DB_ROOT_PASSWORD -D$DB_NAME < /conf/wordpress.sql

	mysqladmin -u${DB_ROOT} -p${DB_ROOT_PASSWORD} shutdown
fi

exec "$@"

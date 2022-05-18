#!/bin/bash
set -x

echo "grant all on *.* to '"${DB_ROOT}"'@'localhost' with grant option;" >> setup.sql
echo "create user '"${DB_ROOT}"'@'%';" >> setup.sql
echo "grant all on *.* to '"${DB_ROOT}"'@'%' with grant option;" >> setup.sql
echo "SET PASSWORD FOR '"${DB_ROOT}"'@'localhost'=PASSWORD('"${DB_ROOT_PASSWORD}"');" >> setup.sql
echo "SET PASSWORD FOR '"${DB_ROOT}"'@'%'=PASSWORD('"${DB_ROOT_PASSWORD}"');" >> setup.sql
echo "FLUSH PRIVILEGES;" >> setup.sql
echo -e "\n" >> setup.sql
echo "CREATE USER '"${DB_USER}"'@'localhost' IDENTIFIED BY '"${DB_USER_PASSWORD}"';" >> setup.sql
echo "CREATE USER '"${DB_USER}"':@'%' IDENTIFIED BY '"${DB_USER_PASSWORD}"';" >> setup.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '"${DB_USER}"'@'localhost';" >> setup.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '"${DB_USER}"'@'%';" >> setup.sql
echo "FLUSH PRIVILEGES;" >> setup.sql
echo -e "\n" >> setup.sql
echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" >> setup.sql

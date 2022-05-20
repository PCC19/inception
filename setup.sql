grant all on *.* to ''@'localhost' with grant option;
create user ''@'%';
grant all on *.* to ''@'%' with grant option;
SET PASSWORD FOR ''@'localhost'=PASSWORD('');
SET PASSWORD FOR ''@'%'=PASSWORD('');
FLUSH PRIVILEGES;
\n
CREATE USER ''@'localhost' IDENTIFIED BY '';
CREATE USER ''@'%' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON *.* TO ''@'localhost';
GRANT ALL PRIVILEGES ON *.* TO ''@'%';
FLUSH PRIVILEGES;
\n
CREATE DATABASE IF NOT EXISTS ;
grant all on *.* to ''@'localhost' with grant option;
create user ''@'%';
grant all on *.* to ''@'%' with grant option;
SET PASSWORD FOR ''@'localhost'=PASSWORD('');
SET PASSWORD FOR ''@'%'=PASSWORD('');
FLUSH PRIVILEGES;
\n
CREATE USER ''@'localhost' IDENTIFIED BY '';
CREATE USER ''@'%' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON *.* TO ''@'localhost';
GRANT ALL PRIVILEGES ON *.* TO ''@'%';
FLUSH PRIVILEGES;
\n
CREATE DATABASE IF NOT EXISTS ;

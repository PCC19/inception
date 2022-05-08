grant all on *.* to 'root'@'localhost' with grant option;
create user 'root'@'%';
grant all on *.* to 'root'@'%' with grant option;
SET PASSWORD FOR 'root'@'localhost'=PASSWORD('imroot');
SET PASSWORD FOR 'root'@'%'=PASSWORD('imroot');
FLUSH PRIVILEGES;

CREATE USER 'pcunha'@'localhost' IDENTIFIED BY 'pcc';
CREATE USER 'pcunha'@'%' IDENTIFIED BY 'pcc';
GRANT ALL PRIVILEGES ON *.* TO 'pcunha'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'pcunha'@'%';
FLUSH PRIVILEGES;

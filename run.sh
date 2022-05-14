# sps -!/bin/bash

# =============================================================================
# Para container se estiverem rodando
docker stop $(docker ps -a -q)
# Apaga containers
docker container rm mariadb nginx wordpress
# Apaga rede
docker network rm rede
# Apaga volumes
docker volume rm site_volume
docker volume rm data_volume

# =============================================================================
# Cria rede
docker network create rede

# Cria volume
docker volume create --driver local --name site_volume
docker volume create --driver local --name data_volume

# =============================================================================
# Faz build das imagen
cd ~/r42/inception/srcs/requirements/mariadb/
docker build -t i_mariadb .
cd ~/r42/inception/srcs/requirements/nginx/
docker build -t i_nginx .
cd ~/r42/inception/srcs/requirements/wordpress/
docker build -t i_wordpress .

# Gera containers na ordem
cd ~/r42/inception/srcs/requirements/
docker run -d -p3306:3306 -v data_volume:/var/lib/mysql --name mariadb i_mariadb
docker run -d -p9000:9000 -v site_volume:/var/www/html/ --name wordpress i_wordpress
docker run -d -p443:443 -v site_volume:/var/www/html/ --name nginx i_nginx
	# Portas
	# Volumes


# Conecta Containers
docker network connect rede mariadb
docker network connect rede nginx
docker network connect rede wordpress

# Starta os servicos na unha
docker exec -it mariadb service mysql start
docker exec -it nginx service nginx start
docker exec -it wordpress service php7.3-fpm start

# lista os processos de cada container para ver se estao rodando
echo -e "MARIADB:\n"
docker top mariadb
echo -e "NGINX:\n"
docker top nginx
echo -e "WORDPRESS:\n"
docker top wordpress


# sps -!/bin/bash

# Para container se estiverem rodando
docker stop $(docker ps -a -q)
# Apaga containers
docker container rm c_mariadb c_nginx c_wordpress
# Apaga rede
docker network rm rede

# Faz build das imagen
cd ~/r42/inception/srcs/requirements/mariadb/
docker build -t i_mariadb .
cd ~/r42/inception/srcs/requirements/nginx/
docker build -t i_nginx .
cd ~/r42/inception/srcs/requirements/wordpress/
docker build -t i_wordpress .

# Gera containers na ordem
cd ~/r42/inception/srcs/requirements/
docker run -d -p3306:3306 --name c_mariadb i_mariadb
docker run -d -p9000:9000 --name c_wordpress i_wordpress
docker run -d -p443:443 --name c_nginx i_nginx
	# Portas
	# Volumes

# Cria rede
docker network create rede
# Conecta Containers
docker network connect rede c_mariadb
docker network connect rede c_nginx
docker network connect rede c_wordpress

# Starta os servicos na unha
docker exec -it c_nginx service nginx start
docker exec -it c_wordpress service php7.3-fpm start

# lista os processos de cada container para ver se estao rodando
echo -e "NGINX:\n"
docker top c_nginx
echo -e "WORDPRESS:\n"
docker top c_wordpress


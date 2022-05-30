.PHONY: all build buildno up down clean fclean ps

YML= -f ./srcs/docker-compose.yml
ENV= --env-file ./srcs/.env


VOLUMES_PATH = /home/pcunha/data
VOLUMES_DIR = db_data site_data
VOLUMES = $(addprefix $(VOLUMES_PATH)/, $(VOLUMES_DIR))


all: down build

$(VOLUMES):
	sudo mkdir -p $(VOLUMES)

build: | $(VOLUMES)
	echo "Configin' /etc/hosts ..."
	bash ./add_host
	echo "Building ..."
	docker-compose $(YML) $(ENV) build

re: fclean | $(VOLUMES)
	echo "Configin' /etc/hosts ..."
	bash ./add_host
	echo "Re Building ..."
	docker-compose $(YML) $(ENV) build --no-cache

up: | $(VOLUMES)
	docker-compose $(YML) $(ENV) up -d 
	docker-compose $(YML) $(ENV) ps -a

down:
	docker-compose $(YML) $(ENV) down

fclean: down
	echo "Removing site from /etc/hosts"
	bash ./remove_host
	echo "Docker pruning ..."
	docker system prune -f -a --volumes
	echo "Deleting volumes and data ..."
	docker volume rm database_volume -f
	docker volume rm site_volume -f
	echo "Deleting volumes host directories ..."
	sudo rm -rf $(VOLUMES_PATH)

clean: down
	echo "Deleting volumes and data ..."
	docker volume rm database_volume -f
	docker volume rm site_volume -f
	echo "Deleting volumes host directories ..."
	sudo rm -rf $(VOLUMES_PATH)

ps:
	docker-compose $(YML) $(ENV) ps -a


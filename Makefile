.PHONY: all build buildno up down clean ps

YML= -f ./srcs/docker-compose.yml
ENV= --env-file ./srcs/.env


VOLUMES_PATH = ${HOME}/pcunha/data
VOLUMES_DIR = db_data site_data
VOLUMES = $(addprefix $(VOLUMES_PATH)/, $(VOLUMES_DIR))


$(VOLUMES):
	mkdir -p $(VOLUMES)

all: down build

build: | $(VOLUMES)
	echo "Configin' /etc/hosts ..."
	./add_host
	echo "Building ..."
	docker compose $(YML) $(ENV) build

buildno: | $(VOLUMES)
	echo "Configin' /etc/hosts ..."
	./add_host
	echo "Building ..."
	docker compose $(YML) $(ENV) build --no-cache

up: | $(VOLUMES)
	docker compose $(YML) $(ENV) up -d 
	docker compose $(YML) $(ENV) ps -a

down:
	docker compose $(YML) $(ENV) down

clean: down
	echo "Removing site from /etc/hosts"
	./remove_host
	echo "Deleting volumes and data ..."
	docker volume rm $$(docker volume ls -q) || rm -rf data

ps:
	docker compose $(YML) $(ENV) ps -a


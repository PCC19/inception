.PHONY: all build buildno up down clean ps

YML= -f ./srcs/docker-compose.yml
ENV= --env-file ./srcs/.env


VOLUMES_PATH = ${HOME}/home/pcunha/data
VOLUMES_DIR = db_data site_data
VOLUMES = $(addprefix $(VOLUMES_PATH)/, $(VOLUMES_DIR))


$(VOLUMES):
	mkdir -p $(VOLUMES)

all: down build

build: | $(VOLUMES)
	echo "Configin' /etc/hosts ..."
	./add_host
	#echo "Creating volumes ..."
	#docker volume create --driver local \
    #--opt type=none \
    #--opt device=$(VOLUMES_PATH)/db_data \
    #--opt o=bind database_volume
	#docker volume create --driver local \
    #--opt type=none \
    #--opt device=$(VOLUMES_PATH)/site_data \
    #--opt o=bind site_volume
	echo "Building ..."
	docker-compose $(YML) $(ENV) build

re: clean | $(VOLUMES)
	echo "Configin' /etc/hosts ..."
	./add_host
	echo "Re Building ..."
	docker-compose $(YML) $(ENV) build --no-cache

up: | $(VOLUMES)
	docker-compose $(YML) $(ENV) up -d 
	docker-compose $(YML) $(ENV) ps -a

down:
	docker-compose $(YML) $(ENV) down

clean: down
	echo "Removing site from /etc/hosts"
	./remove_host
	echo "Deleting volumes and data ..."
	#docker volume rm $$(docker volume ls -q)
	docker volume rm database_volume -f
	docker volume rm site_volume -f
	docker volume prune -f
	echo "Deleting volumes host directories ..."
	rm -rf ~/home

ps:
	docker-compose $(YML) $(ENV) ps -a


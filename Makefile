.PHONY: build buildno up down clean ps

YML= -f ./srcs/docker-compose.yml

build:
	docker compose $(YML) build

buildno:
	docker compose $(YML) build --no-cache

up:
	docker compose $(YML) up -d 
	docker compose $(YML) ps -a

down:
	docker compose $(YML) down

clean:
	docker volume rm srcs_site_volume
	docker volume rm srcs_data_volume

ps:
	docker compose $(YML) ps -a


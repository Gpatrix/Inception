docker_config = srcs/docker-compose.yml

all: build up


build:
	docker compose -f $(docker_config) --parallel 3  build

up:
	docker compose -f $(docker_config) up

stop:
	docker compose -f $(docker_config) stop

down: 
	docker compose -f $(docker_config) down

purge: 
	docker system prune --all --force --volumes

re: down all

.PHONY: build up stop down re purge
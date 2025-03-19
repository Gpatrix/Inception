compos_file = srcs/docker-compose.yml

all: build up

build:
	docker compose -f $(compos_file) --parallel 3  build

up:
	docker compose -f $(compos_file) up

stop:
	docker compose -f $(compos_file) stop

down: 
	docker compose -f $(compos_file) down

purge: 
	docker system prune --all --force --volumes

re: down all

.PHONY: build up stop down re purge
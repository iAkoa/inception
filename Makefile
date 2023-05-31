DOCKER = docker
COMPOSE = $(DOCKER) compose -p inception -f srcs/docker-compose.yml
<<<<<<< HEAD
MARIADB_VOLUME = /nfs/homes/rmattheo/data/mariadb
WORDPRESS_VOLUME =  /nfs/homes/rmattheo/data/wordpress
=======
MARIADB_VOLUME = /home/rmattheo/data/mariadb
WORDPRESS_VOLUME =  /home/rmattheo/data/wordpress
>>>>>>> 61fefd3c98966221609c26bcb6e4d6998504e13e
DEPENDENCIES = $(MARIADB_VOLUME) $(WORDPRESS_VOLUME)

all: up

$(MARIADB_VOLUME):
	mkdir -p $(MARIADB_VOLUME)

$(WORDPRESS_VOLUME):
	mkdir -p $(WORDPRESS_VOLUME)

ps:
	$(COMPOSE) ps

images:
	$(COMPOSE) images

volumes:
	$(DOCKER) volume ls

networks:
	$(DOCKER) network ls

start: $(DEPENDENCIES)
	$(COMPOSE) start

stop:
	$(COMPOSE) stop

restart: $(DEPENDENCIES)
	$(COMPOSE) restart

up: $(DEPENDENCIES)
	$(COMPOSE) up --detach --build

down:
	$(COMPOSE) down

clean:
	$(COMPOSE) down --rmi all --volumes

fclean: clean
<<<<<<< HEAD
	$(RM) -r /nfs/homes/rmattheo/data/*
=======
	sudo $(RM) -r /home/rmattheo/data/*
>>>>>>> 61fefd3c98966221609c26bcb6e4d6998504e13e

prune: down fclean
	$(DOCKER) system prune -a -f

re: fclean all

.PHONY: all ps images volumes networks start stop restart up down clean fclean prune re


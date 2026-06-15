# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vvalenti <vvalenti@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/05/29 13:55:03 by vvalenti          #+#    #+#              #
#    Updated: 2026/06/15 16:59:56 by vvalenti         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = inception

COMPOSE = docker compose -f srcs/docker-compose.yml

all: up

up:
	@mkdir -p /home/vvalenti/data/wordpress /
	@mkdir -p /home/vvalenti/data/mariadb /
	$(COMPOSE) up --build

down:
	$(COMPOSE) down

start:
	$(COMPOSE) start

stop:
	$(COMPOSE) stop

restart:
	$(COMPOSE) restart

logs:
	$(COMPOSE) logs

ps:
	$(COMPOSE) ps

clean:
	$(COMPOSE) down -v --rmi all
	docker system prune -af

fclean: clean
	@sudo rm -rf /home/vvalenti/data/* 

re: fclean all

.PHONY: all up down start stop restart logs ps clean fclean re


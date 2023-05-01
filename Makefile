# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: areheman <areheman@student.42mulhouse.fr>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/01 17:34:20 by areheman          #+#    #+#              #
#    Updated: 2023/05/01 17:34:30 by areheman         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


all: run

run:
	@echo "Building files for volumes ...\n"
	@sudo mkdir -p /home/areheman/data/wordpress
	@sudo mkdir -p /home/areheman/data/mariadb
	@echo "Building containers ... \n"
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

up:
	@echo "Building containers ... \n"
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@echo "Stop containers ... \n"
	@docker-compose -f ./srcs/docker-compose.yml down

clean: down
	@docker rmi -f $$(docker images -qa);
	@docker volume rm $$(docker volume ls -q);

.PHONY: all up down clean run
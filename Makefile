containers=$(shell sudo docker ps -qa)
rm_containers = docker container rm -f $(containers)
images=$(shell sudo docker images -qa)
rm_images = docker rmi -f $(images)

all : up

sudo :
	@sudo -v

up : sudo
	mkdir -p /home/admansar/data/mariadb
	mkdir -p /home/admansar/data/wordpress
	docker compose -f srcs/docker-compose.yml up -d

stop :
	docker compose -f srcs/docker-compose.yml  stop

clean :
	@if  [ -z "$(containers)" ]; then echo "no containers to delete" ; else  $(rm_containers) ;fi

fclean : clean
	@if  [ -z "$(images)" ]; then echo "no images to delete"; else  $(rm_images);fi
	@echo everything is clean no, just go ahead !
	@sudo rm -rf /home/admansar/data
	

sfclean : prune fclean 

prune :
	docker buildx prune -af
	docker system prune --volumes -f

re : sudo fclean all

sre : sudo sfclean all

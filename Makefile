containers=$(shell sudo docker ps -qa)
rm_containers = docker container rm -f $(containers)
images=$(shell sudo docker images -qa)
rm_images = docker rmi -f $(images)
user:=$USER

all :
	mkdir -p /home/admansar/data/
	docker compose -f srcs/docker-compose.yml up
	#docker build -t nginx nginx/
	#docker build -t mariadb mariadb/

stop :
	docker-compose -f requirements  stop

clean :
	@if  [ -z "$(containers)" ]; then echo "no containers to delete" ; else  $(rm_containers) ;fi

fclean : clean
	@if  [ -z "$(images)" ]; then echo "no images to delete"; else  $(rm_images);fi
	@echo everything is clean no, just go ahead !
	rm -rf volumes
	

sfclean : prune fclean 

prune :
	docker buildx prune -af

re : fclean all


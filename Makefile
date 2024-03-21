containers=$(shell sudo docker ps -qa)
rm_containers = docker container rm $(containers)
images=$(shell sudo docker images -qa)
rm_images = docker rmi $(images)

all :
	docker build -t nginx nginx/
	docker build -t mariadb mariadb/


clean :
	@if  [ -z "$(containers)" ]; then echo "no containers to delete" ; else  $(rm_containers) ;fi

fclean : clean
	@if  [ -z "$(images)" ]; then echo "no images to delete"; else  $(rm_images);fi
	@echo everything is clean no, just go ahead !
	

sfclean : prune fclean 

prune :
	docker buildx prune -af

re : fclean all


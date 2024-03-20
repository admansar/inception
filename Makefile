rm_containers = /home/adnan/some_usefull_scripts/rm_images.sh
rm_images = /home/adnan/some_usefull_scripts/rm_containers.sh 

NAME = vim


all  :
	@sudo ls > /dev/null
	docker build -t $(NAME) .

nginx :
	docker build -t nginx nginx/


clean :
	@sudo ls > /dev/null
	$(rm_containers)

fclean : clean
	@sudo ls > /dev/null
	$(rm_images)

sfclean : prune fclean 

prune :
	docker buildx prune -af

re : fclean all


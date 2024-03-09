rm_containers = /home/adnan/some_usefull_scripts/rm_images.sh
rm_images = /home/adnan/some_usefull_scripts/rm_containers.sh 

NAME = vim


all  :
	docker build -t $(NAME) .

clean :
	$(rm_containers)

fclean : clean
	$(rm_images)

sfclean : prune fclean 

prune :
	docker buildx prune -a

re : fclean all


containers=$(shell sudo docker ps -qa)
rm_containers = docker container rm -f $(containers)
images=$(shell sudo docker images -qa)
rm_images = docker rmi -f $(images)
data=/home/admansar/data

all : up

sudo :
	@sudo -v

up : sudo
	mkdir -p $(data)/mariadb
	mkdir -p $(data)/wordpress
	docker compose -f srcs/docker-compose.yml up -d
	$(emo)

stop :
	docker compose -f srcs/docker-compose.yml  stop

clean :
	@if  [ -z "$(containers)" ]; then echo "no containers to delete" ; else  $(rm_containers) ;fi

fclean : clean
	@if  [ -z "$(images)" ]; then echo "no images to delete"; else  $(rm_images);fi
	@echo everything is clean no, just go ahead !
	@sudo rm -rf $(data)

sfclean : fclean prune 

prune :
	docker buildx prune -af
	docker system prune --volumes -f
	docker network prune -f

re : sudo fclean all

sre : sudo sfclean all

emo :
	$(emo)

define emo

@echo " ██████  ███    ██ ███████      ██████  ██████  ███    ██ ████████  █████  ██ ███    ██ ███████ ██████ "
@echo "██    ██ ████   ██ ██          ██      ██    ██ ████   ██    ██    ██   ██ ██ ████   ██ ██      ██   ██"
@echo "██    ██ ██ ██  ██ █████       ██      ██    ██ ██ ██  ██    ██    ███████ ██ ██ ██  ██ █████   ██████ "
@echo "██    ██ ██  ██ ██ ██          ██      ██    ██ ██  ██ ██    ██    ██   ██ ██ ██  ██ ██ ██      ██   ██"
@echo " ██████  ██   ████ ███████      ██████  ██████  ██   ████    ██    ██   ██ ██ ██   ████ ███████ ██   ██"
@echo
@echo
@echo "██ ███████     ███    ██  ██████  ████████     ███████ ███    ██  ██████  ██    ██  ██████  ██   ██ "
@echo "██ ██          ████   ██ ██    ██    ██        ██      ████   ██ ██    ██ ██    ██ ██       ██   ██ "
@echo "██ ███████     ██ ██  ██ ██    ██    ██        █████   ██ ██  ██ ██    ██ ██    ██ ██   ███ ███████ "
@echo "██      ██     ██  ██ ██ ██    ██    ██        ██      ██  ██ ██ ██    ██ ██    ██ ██    ██ ██   ██ "
@echo "██ ███████     ██   ████  ██████     ██        ███████ ██   ████  ██████   ██████   ██████  ██   ██ "
@echo
@echo
@echo "\033[38;5;196m"
@echo "██     ██ ███████     ███    ██ ███████ ███████ ██████      ████████  ██████       ██████   ██████  "
@echo "██     ██ ██          ████   ██ ██      ██      ██   ██        ██    ██    ██     ██       ██    ██ "
@echo -n "\033[38;5;196m"
@echo "██  █  ██ █████       ██ ██  ██ █████   █████   ██   ██        ██    ██    ██     ██   ███ ██    ██ "
@echo "██ ███ ██ ██          ██  ██ ██ ██      ██      ██   ██        ██    ██    ██     ██    ██ ██    ██ "
@echo -n "\033[38;5;160m"
@echo " ███ ███  ███████     ██   ████ ███████ ███████ ██████         ██     ██████       ██████   ██████  "
@echo
@echo
@echo -n "\033[38;5;124m"
@echo " \t\t\t██████  ███████ ███████ ██████  ███████ ██████ "
@echo " \t\t\t██   ██ ██      ██      ██   ██ ██      ██   ██"
@echo -n "\033[38;5;88m"
@echo " \t\t\t██   ██ █████   █████   ██████  █████   ██████ "
@echo " \t\t\t██   ██ ██      ██      ██      ██      ██   ██"
@echo -n "\033[38;5;52m"
@echo " \t\t\t██████  ███████ ███████ ██      ███████ ██   ██"
@echo "\033[0m"
                                                                                                                                                                                                     

endef



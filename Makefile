containers=$(shell sudo docker ps -qa)
rm_containers = docker container rm -f $(containers)
images=$(shell sudo docker images -qa)
rm_images = docker rmi -f $(images)
data=/home/admansar/data
envp=/home/admansar/inception/srcs/.env
all : check

check:
	@if [ -f srcs/.env ]; then \
		$(MAKE) up; \
		else \
		echo "-------------------------------------------------"; \
		echo "|ERROR: Missing .env file inside the srcs folder.|"; \
		echo "|To see an example, run         'make env'.      |"; \
		echo "-------------------------------------------------"; \
		exit 0; \
		fi

env:
	if [ -f srcs/.env ]; then \
		echo "its already there !!"; \
		else \
		$(MAKE) creat-env; \
		fi


creat-env:
	@echo env file created with succes ... please add your data to it
	@sleep 1
	@echo "DOMAIN_NAME=" >> $(envp)
	@echo "WP_TITLE=" >> $(envp)
	@echo "WP_USER=" >> $(envp)
	@echo "WP_PASSWORD=" >> $(envp)
	@echo "WP_EMAIL=" >> $(envp)
	@echo "ADMIN_NAME=" >> $(envp)
	@echo "ADMIN_PASSWORD=" >> $(envp)
	@echo "ADMIN_EMAIL=" >> $(envp)
	@echo "WP_DATABASE=" >> $(envp)
	@echo "MARIADB_USER=" >> $(envp)
	@echo "MARIADB_PASSWORD=" >> $(envp)
	@echo "MARIADB_DATABASE=" >> $(envp)
	@echo "MARIADB_ROOT_PASSWORD=" >> $(envp)
	@echo "MARIADB_TABLE_NAME=" >> $(envp)
	@echo "FTP_USER=" >> $(envp)
	@echo "FTP_PASS=" >> $(envp)
	@vim $(envp)

sudo :
	@sudo -v

up : sudo
	$(emo)
	@mkdir -p $(data)/mariadb
	@mkdir -p $(data)/wordpress
	@mkdir -p $(data)/static-website
	@docker compose -f srcs/docker-compose.yml up -d

stop :
	docker compose -f srcs/docker-compose.yml  stop

clean :
	@if  [ -z "$(containers)" ]; then echo "no containers to delete" ; else  $(rm_containers) ;fi

fclean : clean
	@if  [ -z "$(images)" ]; then echo "no images to delete"; else  $(rm_images);fi
	@echo everything is clean no, just go ahead !

sfclean : fclean prune 

prune :
	@docker buildx prune -af
	@docker system prune --volumes -f
	@docker network prune -f
	@sudo rm -rf $(data)

re : sudo fclean all

sre : sudo sfclean all

emo :
	$(emo)

define emo

@clear
@echo
@echo
@echo
@echo
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
@sleep 1
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
@echo
@echo
@echo
@echo
@sleep 2
@clear
                                                                                                                                                                                                     

endef



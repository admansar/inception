FROM debian:stable

RUN apt update && apt upgrade -y 
RUN apt install apache2 php8.2 php8.2-cli php8.2-common php8.2-imap php8.2-redis php8.2-snmp php8.2-xml php8.2-mysqli php8.2-zip php8.2-mbstring php8.2-curl libapache2-mod-php mariadb-server wget -y
RUN wget https://downloads.mysql.com/archives/get/p/23/file/mysql-server_8.2.0-1debian12_amd64.deb-bundle.tar && tar -xvf *.tar && rm *.tar && apt install ./*deb -y && rm *.deb

ENTRYPOINT mariadb && bash

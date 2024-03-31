FROM debian:12

RUN apt update && apt upgrade -y 

RUN apt install -y mariadb-server

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./ /

RUN mkdir -p /run/mysqld

EXPOSE 3306

CMD ["sh", "/tools/script.sh"]


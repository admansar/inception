FROM debian:stable

RUN apt update -y 

RUN apt install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./ /maria

RUN mkdir -p /run/mysqld

EXPOSE 3306

CMD ["sh", "/maria/tools/script.sh"]


FROM debian:12

RUN apt update && apt upgrade -y

RUN apt install wget mariadb-server -y 

COPY ./50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY run_it.sh /

EXPOSE 3306

RUN mkdir -p /run/mysqld

CMD sh run_it.sh 


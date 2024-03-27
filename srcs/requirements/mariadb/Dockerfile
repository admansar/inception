FROM debian:12

RUN apt update && apt upgrade -y

RUN apt install mariadb-server -y

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY run_it.sh /

EXPOSE 3306

CMD bash run_it.sh 

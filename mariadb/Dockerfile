FROM debian

RUN apt update && apt upgrade -y

RUN apt install wget mariadb-server -y 

COPY run_it.sh /

EXPOSE 3306

RUN mkdir -p /run/mysqld

CMD sh run_it.sh 


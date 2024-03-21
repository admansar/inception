FROM debian

RUN apt update && apt upgrade -y

RUN apt install wget mariadb-server -y 

COPY run_it.sh /

EXPOSE 3306

CMD sh run_it.sh 


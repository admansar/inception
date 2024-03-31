FROM debian:12

RUN apt update && apt upgrade -y

RUN apt install redis-server php-redis vim -y

EXPOSE 6379

COPY tools /

CMD bash /run_it.sh


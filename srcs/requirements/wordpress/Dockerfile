FROM debian:stable

RUN apt update -y

RUN apt install -y php8.2-fpm

RUN apt install -y php8.2

RUN apt install php8.2-mysql

RUN apt install -y wget

RUN apt install -y unzip

RUN apt install -y curl

RUN sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

COPY . /wordpressSetUp

EXPOSE 9000

RUN mkdir -p /var/www/html

CMD ["sh", "/wordpressSetUp/tools/setup.sh"]

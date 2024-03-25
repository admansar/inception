FROM debian:12

RUN apt update && apt upgrade -y 

RUN apt install vim wget php php-fpm php-mysql mariadb-client -y

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www 

RUN tar -xzf /var/www/wordpress-6.0-fr_FR.tar.gz -C /var/www 

RUN mv /var/www/wordpress/* /var/www/html 

RUN rm -rf /var/www/wordpress-6.0-fr_FR.tar.gz /var/www/wordpress

RUN chown -R www-data:www-data /var/www/html

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./www.conf /etc/php/8.2/fpn/pool.d/www.conf

COPY ./run_wp.sh /

CMD bash /run_wp.sh


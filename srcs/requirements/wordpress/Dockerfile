FROM debian:12

RUN apt update && apt upgrade -y 

RUN apt install vim wget php php-fpm php-mysql mariadb-client -y

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp


#COPY ./run_wp.sh /

#CMD bash run_wp.sh


#!/bin/bash

wp core download --allow-root
wp config create	--allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL --skip-email --allow-root

#cd /var/www/html 
#
#if [ $(ls | wc -l) -ne 0 ]
#then 
#	rm -rf * 
#fi
#
#wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
#
#chmod +x wp-cli.phar
#
#mv wp-cli.phar /usr/local/bin/wp
#
#
#wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --skip-check --allow-root
#wp theme install teluro --activate --allow-root
#wp user create adnan --role=author --user_pass=adnan --allow-root
#
/usr/sbin/php-fpm7.3 -F
#
#bash

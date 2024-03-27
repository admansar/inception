#!/bin/bash


#cd /var/www/html

wp core download --allow-root 
wp cli update
wp config create	--allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306

wp core install --url=localhost --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL --skip-email --allow-root

/usr/sbin/php-fpm8.2 -F

#bash

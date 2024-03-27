sleep 5

wordpressInit()
{
	cd /var/www/html

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

	chmod +x wp-cli.phar

	mv wp-cli.phar /usr/local/bin/wp

	wp --info

	wp --allow-root --path=/var/www/html/ core download

	wp --allow-root --path=/var/www/html/ config create --dbname=${SQL_DATABASE} --dbuser=${SQL_USER} --dbpass=${SQL_PASSWORD} 		--dbhost=mariadb:3306

	wp --allow-root --path=/var/www/html/ core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_name=${ADMIN_NAME}\
	--admin_password=${ADMIN_PASSWORD} --admin_email=${WP_EMAIL}
	wp --allow-root user create ${USER_NAME} ${USER_EMAIL} --role=author --user_pass=${WP_PASSWORD}

}


if ! [ -f /var/www/html/index.php ];
then
	echo "Need to install wordpress"
	wordpressInit	
else
	echo "No need to install wordpress"
fi

ls /wordpressSetUp/tools

ls /var/www/html

php-fpm8.2 -F


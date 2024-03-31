sleep 5 #just to make sure the mariadb container has finished, remember the container not the image

if ! [ -f /var/www/html/index.php ]
then
	echo "installing wordpress ..."
	cd /var/www/html
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp --allow-root --path=/var/www/html/ core download
	wp --allow-root --path=/var/www/html/ config create --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=mariadb:3306
	wp --allow-root --path=/var/www/html/ core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_name=$ADMIN_NAME --admin_password=$ADMIN_PASSWORD --admin_email=$WP_EMAIL
	wp --allow-root user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD
	wp --allow-root theme install twentytwentythree --activate
else
	echo "wordpress is already in"
fi

php-fpm8.2 -F


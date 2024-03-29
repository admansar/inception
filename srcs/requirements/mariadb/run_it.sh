#!/bin/bash

mkdir -p /run/mysqld

service mariadb start

echo "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE ;" > lol
echo "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD' ;" >> lol
echo "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' ;" >> lol
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> lol
echo "FLUSH PRIVILEGES;" >> lol

mariadbd --user=mysql --bootstrap < lol

rm  lol

service mariadb stop

mariadbd --user=root 

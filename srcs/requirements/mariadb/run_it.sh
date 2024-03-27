#!/bin/bash

mkdir -p /run/mysql && chown -R mysql:mysql /run/mysql

service mariadb start


echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE ;" > lol
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD' ;" >> lol
echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' ;" >> lol
#echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> lol
echo "FLUSH PRIVILEGES;" >> lol

mariadbd --user=mysql --bootstrap < lol

rm  lol

service mariadb stop

mysqld_safe --user=mysql --bind-address=0.0.0.0

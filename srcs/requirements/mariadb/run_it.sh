#!/bin/bash

#service mariadb start 

echo  "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;" >> lol
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD'; " >> lol
echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%'; " >> lol
echo "ALTER USER 'root'@'%' IDENTIFIED BY '12345'; " >> lol
echo "FLUSH PRIVILEGES;" >> lol

mariadbd --bootstrap --user=root < lol

#--bootstrap >>> to read



rm lol

mariadbd --user=root 
#while true 
#do sleep 1; done

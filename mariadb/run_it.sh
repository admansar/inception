#!/bin/bash

#service mariadb start 

echo  "CREATE DATABASE IF NOT EXISTS $db1_name;" >> lol
echo "CREATE USER IF NOT EXISTS '$db1_user'@'%' IDENTIFIED BY '$db1_pwd'; " >> lol
echo "GRANT ALL PRIVILEGES ON $db1_name.* TO '$db1_user'@'%'; " >> lol
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345'; " >> lol
echo "FLUSH PRIVILEGES;" >> lol

mariadbd --bootstrap --user=root < lol

#--bootstrap >>> to read



rm lol

mariadbd --user=root 
#while true 
#do sleep 1; done




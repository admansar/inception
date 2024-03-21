#!/bin/bash

service mariadb start 

mysql   < "CREATE DATABASE IF NOT EXISTS $db1_name ;CREATE USER IF NOT EXISTS '$db1_user'@'%' IDENTIFIED BY '$db1_pwd'GRANT ALL PRIVILEGES ON $db1_name.* TO '$db1_user'@'%' ;ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;FLUSH PRIVILEGES;EXIT;"



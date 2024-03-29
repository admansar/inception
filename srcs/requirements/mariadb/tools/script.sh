sed -i "s/mysqlUser/${MARIADB_USER}/" /maria/conf/init.sql

sed -i "s/mysqlUserPass/${MARIADB_PASSWORD}/"  /maria/conf/init.sql

sed -i "s/mysqlRootPass/${MARIADB_ROOT_PASSWORD}/" /maria/conf/init.sql

sed -i "s/mysqlDb/${WP_DATABASE}/" /maria/conf/init.sql

sed -i "s/mysqlTable/${MYSQL_TABLE_NAME}/" /maria/conf/init.sql

mariadbd --bootstrap --user=root < /maria/conf/init.sql


mariadbd --user=root

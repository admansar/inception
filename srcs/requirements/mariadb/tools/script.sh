sed -i "s/mysqlUser/${MARIADB_USER}/" /tools/init.maria

sed -i "s/mysqlUserPass/${MARIADB_PASSWORD}/"  /tools/init.maria

sed -i "s/mysqlRootPass/${MARIADB_ROOT_PASSWORD}/" /tools/init.maria

sed -i "s/mysqlDb/${WP_DATABASE}/" /tools/init.maria

sed -i "s/mysqlTable/${MYSQL_TABLE_NAME}/" /tools/init.maria

mariadbd --bootstrap --user=root < /tools/init.maria


mariadbd --user=root

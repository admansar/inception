#!/bin/bash

echo "maxmemory 256mb" >> /etc/redis/redis.conf
echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf

sed -i "s/127.0.0.1/0.0.0.0/" /etc/redis/redis.conf


if [ ! -f /var/www/html/wp-config.php ]
then
	echo waiting for config.php to be created for wordpress;
	stime=$(date +%s);
	while [ ! -f /var/www/html/wp-config.php ]
	do
		sleep 1;
	done
	etime=$(date +%s);
	echo waited for $((etime - stime)) seconds, finishing the redis server ....
	vim -s /add_redis_conf.vim /var/www/html/wp-config.php

fi



redis-server --protected-mode no

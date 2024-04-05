#!/bin/bash

vim -c ":57s/\n/ServerName 0.0.0.0\r/g | w" /etc/apache2/apache2.conf

mv /index /var/www/html/index.html

apache2ctl -X


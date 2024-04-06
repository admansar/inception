#!/bin/bash

vim -s conf.vim /etc/apache2/apache2.conf

mv /index /var/www/html/index.html
echo everthing is there ... go ahaid 

apache2ctl -X


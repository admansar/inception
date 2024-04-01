#!/bin/bash

wget  https://www.adminer.org/latest.php -O /var/www/html/index.php

php -S 0.0.0.0:8080 -t /var/www/html

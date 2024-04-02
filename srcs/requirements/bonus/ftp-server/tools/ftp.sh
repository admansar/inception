#!/bin/bash

echo $FTP_PASSWORD >> lol 
echo $FTP_PASSWORD >> lol 
adduser $FTP_USER < lol
usermod -d /var/www/html/ $FTP_USER
vim -s /ftp_conf.vim /etc/vsftpd.conf
rm lol
vsftpd

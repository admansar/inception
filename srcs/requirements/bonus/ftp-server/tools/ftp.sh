#!/bin/bash

vim -s /ftp_conf.vim /etc/vsftpd.conf
mkdir -p /var/run/vsftpd/empty
useradd $FTP_USER
mkdir /home/$FTP_USER
chmod 755 /home/$FTP_USER
echo $FTP_USER:$FTP_PASS | chpasswd 
usermod -d /var/www/html/ $FTP_USER
echo -e "\033[0;32m"
echo '<---------------------------------------------------------------------------------------->'
echo "|for easy connection, install filezilla and connect using $(hostname -I) as a host name ... |"
echo '<---------------------------------------------------------------------------------------->'
echo -e "\033[0m"

vsftpd

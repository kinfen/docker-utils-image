#!/bin/sh

echo "pasv_max_port=$PASV_MAX" >> /etc/vsftpd/vsftpd.conf 
echo "pasv_min_port=$PASV_MIN" >> /etc/vsftpd/vsftpd.conf 

mkdir /home/vsftpd/$FTP_USER/ 
chown -R $FTP_USER:www-data /home/vsftpd/$FTP_USER/
echo "" >> /conf/vsftpd/users_config/$FTP_USER
echo "$FTP_USER:$(openssl passwd -1 $FTP_PASS)" >> /conf/vsftpd/virtual_users
chmod 600 /conf/vsftpd/virtual_users



#!/bin/bash

# UTILS="utils-lite
# 	utils-baseimage
# 	utils-vsftpd
# 	utils-privoxy
# 	utils-mongo
# 	utils-jenkins
# 	utils-nginx
# 	utils-ftp
# 	utils-nodexm
# 	utils-dockeragent
#	utils-redis
#	utils-mysql
#	utils-cnpm.org
#	utils-tomcat"
UTILS="utils-cnpm.org"

for util in $UTILS; do
	docker push kinfen/$util:latest
done
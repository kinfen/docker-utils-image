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
#	utils-tomcat
# utils-docker
	# utils-gogs"
UTILS="utils-node-py"


for util in $UTILS; do
	docker build ./$util -t kinfen/$util:latest
done
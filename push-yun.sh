#!/bin/bash
ALIYUN_SERVER="registry.cn-shenzhen.aliyuncs.com/kstudio"
# UTILS="utils-lite
# 	utils-baseimage
# 	utils-vsftpd"
	# utils-privoxy
	# utils-mongo
	# utils-jenkins
	# utils-nginx
	# utils-ftp
	# utils-nodexm
	# utils-dockeragent
	# utils-redis
	# utils-mysql
	# utils-cnpm.org
	# utils-tomcat"
UTILS="utils-privoxy
	utils-mongo
	utils-jenkins
	utils-nginx
	utils-ftp"

for util in $UTILS; do
	docker push $ALIYUN_SERVER/$util:latest
done
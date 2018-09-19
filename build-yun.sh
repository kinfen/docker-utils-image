#!/bin/bash
ALIYUN_SERVER="registry.cn-shenzhen.aliyuncs.com"
UTILS="utils-lite
	utils-baseimage
	utils-vsftpd
	utils-privoxy
	utils-mongo
	utils-jenkins
	utils-nginx
	utils-ftp
	utils-nodexm
	utils-dockeragent
	utils-redis
	utils-mysql
	utils-cnpm.org
	utils-tomcat"
# UTILS="utils-cnpm.org"

for util in $UTILS; do
	docker build ./$util -t $ALIYUN_SERVER/kstudio/$util:latest
done
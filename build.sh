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
# 	utils-dockeragent"
UTILS="utils-nodexm "

for util in $UTILS; do
	docker build ./$util -t kinfen/$util:latest
done
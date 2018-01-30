#!/bin/bash

UTILS="utils-lite
	utils-baseimage
	utils-vsftpd
	utils-privoxy
	utils-mongo
	utils-jenkins"

for util in $UTILS; do
	docker build ./$util -t kinfen/$util:latest
done
#!/bin/bash

UTILS="utils-lite
	utils-baseimage
	utils-vsftpd
	utils-privoxy"

for util in $UTILS; do
	docker build ./$util -t kinfen/$util:latest
done
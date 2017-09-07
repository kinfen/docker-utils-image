#!/bin/sh

if [ ! -f "/swapfile" ]; then
	set -x && \
	echo "准备内存交换文件" \
	&& fallocate -l 2G /swapfile \
	&& chmod 600 /swapfile \
	&& mkswap /swapfile \
	&& swapon /swapfile \
	&& echo "/swapfile   none    swap    sw    0   0" >> /etc/fstab
fi
#!/bin/sh
set -x
set -e
echo "nginx is going to start"
sudo -u nginx -E nginx

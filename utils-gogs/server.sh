#!/bin/sh
set -x
set -e
echo "gogs is going to start" \
&& cd /home/gogs/go/bin \
&& sudo -u gogs -H ./gogs web -c /home/gogs/go/custom/conf/app.ini

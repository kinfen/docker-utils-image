#!/bin/sh
set -x
set -e
echo "gogs is going to start" \
&& cd /home/gogs/go/bin \
&& sudo -u gogs -E ./gogs web -c /home/gogs/go/custom/conf/app.ini

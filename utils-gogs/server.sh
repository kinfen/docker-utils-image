#!/bin/sh
set -x
set -e
echo "gogs is going to start" \
&& gogs web -c ~/app.ini
    
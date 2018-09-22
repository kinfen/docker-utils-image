#!/bin/sh
set -x
set -e
echo "gogs is going to start" \
&& sudo -u gogs -H gogs web
    
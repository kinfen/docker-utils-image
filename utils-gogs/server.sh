#!/bin/sh
set -x \
    echo "gogs is going to start" \
    && gogs web -c ~/app.ini
    
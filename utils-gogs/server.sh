#!/bin/sh
set -x \
    echo "gogs is going to start" \
    && su - git && gogs web -c ~/app.ini
    
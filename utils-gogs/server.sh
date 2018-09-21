#!/bin/sh
set -x \
    echo "gogs is going to start" \
    && sed -i "s/RUN_USER = gogs/RUN_USER=git/" ${GIT_HOME}/app.ini
    && su - git && gogs web -c ~/app.ini
    
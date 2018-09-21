#!/bin/sh
set -x
set -e
setids() {
    PUID=${PUID:-1000}
    PGID=${PGID:-1000}
    groupmod -o -g "$PGID" $GOGS_USER
    usermod -o -u "$PUID" $GOGS_USER
}
setids
echo "gogs is going to start" \
&& gogs web -c ~/app.ini
    
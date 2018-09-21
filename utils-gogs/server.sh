#!/bin/sh
set -e
echo "gogs is going to start"
su - git
gogs web -c ~/app.ini
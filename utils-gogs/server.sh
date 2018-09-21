#!/bin/sh
set -e
echo "gogs is going to start"
sudo -u git -H gogs web -c ~/app.ini
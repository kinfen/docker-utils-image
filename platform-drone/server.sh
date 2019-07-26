#!/bin/sh
echo "drone is going to start"

# echo "export ${ENV_VARS}" >> /home/drone/.bashrc
# chown -hR drone:drone /bin/drone-server \
#     && chown -hR drone:drone /data
/bin/drone-server

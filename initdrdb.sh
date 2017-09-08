#!/bin/bash

echo "准备安装drdb工具"


sudo add-apt-repository ppa:linbit/linbit-drbd9-stack && sudo apt-get update && sudo apt-get install -y drbd-utils python-drbdmanage drbd-dkms

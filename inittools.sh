#!/bin/bash

set -x \
	echo "准备监控工具ctop" \
	&& sudo wget https://github.com/bcicen/ctop/releases/download/v0.6.1/ctop-0.6.1-linux-amd64 -O /usr/bin/ctop \
	&& sudo chmod +x /usr/bin/ctop
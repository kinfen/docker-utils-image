
FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-nodexm

MAINTAINER Kinfen

# this image is base from nodejs and to install yarn in this step, it may use fo build apps or run apps

# Set one or more individual labels
LABEL version="0.0.1"
LABEL description="for node-build"
LABEL publishdate="2019-8-8"

ENV HOME="/data" \
    NODE_ENV=production
ENV DATA_DIR="${HOME}/.cnpmjs.org"
RUN set -x && mkdir -p ${DATA_DIR} \
	&& chown -R $NODE_USER:$NODE_USER $HOME /usr/local/lib/node_modules
RUN set -x \
	&& apk --update add --no-cache --virtual .build-deps \
	python make gcc libgcc g++ \
	&& apk --update add --no-cache --virtual add sudo \
	&& npm install -g --build-from-source --unsafe-perm cnpmjs.org cnpm sqlite3 --registry=https://r.npm.taobao.org \
	&& npm cache clean --force \
	&& apk del .build-deps \
	&& rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 
RUN sed  -i "s/path.join(dataDir, 'pid')/path.join('\/home\/node', 'pid')/"  /usr/local/lib/node_modules/cnpmjs.org/bin/cli.js
COPY config.json ${DATA_DIR}/
COPY server.sh /usr/bin
RUN chown -R $NODE_USER:$NODE_USER $HOME \
	 /home/$NODE_USER \
	 /usr/local/lib/node_modules/cnpmjs.org/view/ \
	 /usr/local/lib/node_modules/cnpmjs.org/docs/

EXPOSE 7001/tcp 7002/tcp
CMD ["sh", "/usr/bin/server.sh"]
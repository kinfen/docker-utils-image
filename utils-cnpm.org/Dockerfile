
FROM kinfen/utils-nodexm

MAINTAINER Kinfen

# this image is base from nodejs and to install yarn in this step, it may use fo build apps or run apps

# Set one or more individual labels
LABEL version="0.0.1-beta"
LABEL description="for node-build"
LABEL publishdate="2018-9-1"
USER root
ARG dockerGid=999
ENV HOME="/data" \
    NODE_ENV=production
ENV DATA_DIR="${HOME}/.cnpmjs.org"
RUN set -x \
	&& apk --update add --no-cache --virtual .build-deps \
	python make gcc libgcc g++
RUN set -x mkdir -p ${DATA_DIR} \
  && npm install -g --build-from-source --registry=https://registry.npm.taobao.org --disturl=https://npm.taobao.org/mirrors/node --unsafe-perm cnpmjs.org cnpm sqlite3 \
	&& npm cache clean --force 
RUN set -x apk del .build-deps \
	&& rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 

RUN sed  -i "s/path.join(dataDir, 'pid')/path.join('\/', 'pid')/"  /usr/local/bin/cnpmjs.org
COPY config.json ${DATA_DIR}/

EXPOSE 7001/tcp 7002/tcp
WORKDIR ${HOME}
CMD cnpmjs.org start
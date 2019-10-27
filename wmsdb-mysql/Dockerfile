FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-mysql:latest
LABEL version="0.0.1"
LABEL description="for wms db"
LABEL publishdate="2019-7-24"


COPY sql/* /docker-entrypoint-initdb.d/

RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/
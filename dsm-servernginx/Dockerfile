
FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-nginx:latest

ENV DMS_HOST=192.168.56.102
ENV PHOTO_PORT=80

COPY nas.conf /etc/nginx/conf.d/

RUN sed -i "s/DMS_HOST/${DMS_HOST}/g" /etc/nginx/conf.d/nas.conf \
	&& sed -i "s/PHOTO_PORT/${PHOTO_PORT}/g" /etc/nginx/conf.d/nas.conf

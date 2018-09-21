FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-lite:latest
MAINTAINER Kinfen

ENV GIT_HOME=/home/git
# create git user and config git


RUN apk --upgrade add gogs
EXPOSE 3000
ENTRYPOINT gogs
CMD ["web"]





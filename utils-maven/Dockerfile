FROM 108.88.5.181:5000/utils-jdk7:latest

LABEL version="0.0.1"
LABEL description="for jdk7"
LABEL publishdate="2019-7-23"

ENV MAVEN_VERSION_SHORT 3
ENV MAVEN_VERSION 3.6.1
ENV PATH /etc/maven/bin:$PATH

RUN mkdir /etc/maven/ && cd /etc/maven/ \
    && wget https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-$MAVEN_VERSION_SHORT/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz -O maven.tar \
    && tar xzvf maven.tar && mv /etc/maven/apache-maven-$MAVEN_VERSION/* . && rm maven.tar && rm -rf /etc/maven/apache-maven-$MAVEN_VERSION

# RUN echo 'export PATH="$PATH:/etc/maven/bin"' >> /etc/profile && source /etc/profile  && echo $PATH 


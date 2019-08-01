FROM mysql:5.7
ENV TZ Asia/Shanghai
ENV DOCKERID 1000
RUN set -x \
    && echo "collation-server=utf8mb4_general_ci\n\
#default-character-set=utf8\n\
character-set-server=utf8mb4\n\
init_connect='SET NAMES utf8mb4'\n\
max_connections=500" >> /etc/mysql/mysql.conf.d/mysqld.cnf \
    && echo "default-character-set=utf8mb4\n\
[client]\n\
default-character-set=utf8mb4" >> /etc/mysql/conf.d/mysql.cnf \
    && echo "default-character-set=utf8mb4" >> /etc/mysql/conf.d/mysqldump.cnf

RUN usermod -u $DOCKERID mysql && groupmod -g $DOCKERID mysql \
    && chown -R mysql:mysql /etc/mysql/ /var/lib/mysql /var/log/mysql


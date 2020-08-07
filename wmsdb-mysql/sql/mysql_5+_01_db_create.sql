drop database if exists wms;
create user 'wms'@'%';
create database if not exists wms character set utf8mb4;
grant all privileges on wms.* to 'wms'@'%' identified by '1qazXSW@' with grant option;

flush privileges;

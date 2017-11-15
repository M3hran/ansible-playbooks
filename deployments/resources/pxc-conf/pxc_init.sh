#!/bin/bash

service xinetd start
envsubst < /etc/mysql/my.cnf.template > /etc/mysql/my.cnf 
chown -R mysql: /var/lib/mysql
#setuser mysql service mysql start

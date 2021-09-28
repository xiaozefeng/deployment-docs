#!/bin/bash

set -e

yum install -y wget

# download sql file
wget http://fiels.union-market.cn/msyql-init.sql

mysql -u root -p '1qaz@WSX123' -h 127.0.0.1 <mysql-init.sql

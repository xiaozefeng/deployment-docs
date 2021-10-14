#!/bin/bash

set -e

if [ -f "/etc/yum.repos.d/mysql-community.repo" ]; then
    echo "/etc/yum.repos.d/mysql-community.repo already exits"
    exit 0
fi

# 1. download rpm package
yum install -y wget
wget http://files.union-market.cn/mysql57-community-release-el7-11.noarch.rpm

# 2. localinstall
yum localinstall -y mysql57-community-release-el7-11.noarch.rpm

# 3. write config
mv /etc/yum.repos.d/mysql-community.repo /etc/yum.repos.d/mysql-community.repo.backup

wget http://files.union-market.cn/mysql-community.repo -O /etc/yum.repos.d/mysql-community.repo

# 4. starting install mysql server
yum install -y mysql-community-server

# 5. mysql server config
cat <<EOF >/etc/my.cnf
[mysql]
default-character-set=utf8
# For advice on how to change settings please see
# http://dev.mysql.com/doc/refman/5.7/en/server-configuration-defaults.html

[mysqld]
#
# Remove leading # and set to the amount of RAM for the most important data
# cache in MySQL. Start at 70% of total RAM for dedicated server, else 10%.
# innodb_buffer_pool_size = 128M
#
# Remove leading # to turn on a very important data integrity option: logging
# changes to the binary log between backups.
# log_bin
#
# Remove leading # to set options mainly useful for reporting servers.
# The server defaults are faster for transactions and fast SELECTs.
# Adjust sizes as needed, experiment to find the optimal values.
# join_buffer_size = 128M
# sort_buffer_size = 2M
# read_rnd_buffer_size = 2M
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock

# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0

log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
skip-name-resolve
max_connections=1000
character-set-server=utf8
default-storage-engine=INNODB
lower_case_table_names=1
max_allowed_packet=34M
transaction-isolation=READ-COMMITTED
innodb_log_file_size=512M
binlog_format = ROW
EOF

# 6. start mysql server
systemctl enable --now mysqld

systemctl status mysqld

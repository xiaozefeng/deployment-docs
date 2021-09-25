#!/bin/bash

set -e

yum install -y wget
wget http://files.union-market.cn/jdk-8u281-linux-x64.tar.gz

tar zxf jdk-8u281-linux-x64.tar.gz -C /usr/local/

# set jdk env
echo 'JAVA_HOME=/usr/local/jdk1.8.0_281' >>/etc/profile
echo 'export PATH=$PATH:$JAVA_HOME/bin' >>/etc/profile
source /etc/profile

java -version

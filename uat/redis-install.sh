#!/bin/bash

set -e

# 1. download
yum install -y wget
wget http://download.redis.io/releases/redis-5.0.12.tar.gz

# 2. extract the package
tar zxf redis-5.0.12.tar.gz

# 3. install requirements
yum install -y gcc gcc-c++ kernel-devel

# 4. compile
cd redis-5.0.12 && make

# 5. set executable
cp src/redis-server /usr/bin/
cp src/redis-cli /usr/bin/
cp src/redis-benchmark /usr/bin/

# 6. get config file
wget http://files.union-market.cn/redis.conf -O /etc/redis.conf

# 7. start redis server
/usr/bin/redis-server /etc/redis.conf


/usr/bin/redis-server -v


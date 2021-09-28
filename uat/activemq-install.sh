#!/bin/bash

set -e

if [ -d "/usr/local/apache-activemq-5.15.15" ]; then
    echo "/usr/local/apache-activemq-5.15.15 already exists"
    exit 0
fi

# 1. download
yum install -y wget
wget https://dlcdn.apache.org//activemq/5.15.15/apache-activemq-5.15.15-bin.tar.gz

# 2. extract package
tar zxf apache-activemq-5.15.15-bin.tar.gz -C /usr/local

# 3. set activemq.xml
mv /usr/local/apache-activemq-5.15.15/conf/activemq.xml /usr/local/apache-activemq-5.15.15/conf/activemq-backup.xml

wget http://files.union-market.cn/activemq.xml -O /usr/local/apache-activemq-5.15.15/conf/activemq.xml

mv /usr/local/apache-activemq-5.15.15/conf/credentials.properties /usr/local/apache-activemq-5.15.15/conf/credentials-backup.properties
cat <<EOF >/usr/local/apache-activemq-5.15.15/conf/credentials.properties
## ---------------------------------------------------------------------------
## Licensed to the Apache Software Foundation (ASF) under one or more
## contributor license agreements.  See the NOTICE file distributed with
## this work for additional information regarding copyright ownership.
## The ASF licenses this file to You under the Apache License, Version 2.0
## (the "License"); you may not use this file except in compliance with
## the License.  You may obtain a copy of the License at
##
## http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
## ---------------------------------------------------------------------------

# Defines credentials that will be used by components (like web console) to access the broker

#activemq.username=system
activemq.username=tripmq
activemq.password=d$4cceac151*abf
guest.password=password
EOF

/usr/local/apache-activemq-5.15.15/bin/activemq start

/usr/local/apache-activemq-5.15.15/bin/activemq status

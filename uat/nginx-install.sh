#!/bin/bash

set -e

# downlaod
yum install -y wget
wget http://files.union-market.cn/nginx-1.20.1.tar.gz

# extract tar package
tar zxf nginx-1.20.1

# install requirements
yum install \
    gcc \
    zlib-devel \
    openssl-devel \
    make \
    pcre-devel \
    libxml2-devel \
    libxslt-devel \
    libgcrypt-devel \
    gd-devel \
    perl-ExtUtils-Embed \
    GeoIP-devel

# cmpile
nginx-1.20.1

./configure \
    --with-pcre \
    --prefix=/usr/local/nginx \
    --user=root \
    --group=root \
    --with-threads \
    --with-file-aio \
    --with-http_ssl_module \
    --with-http_v2_module \
    --with-http_realip_module \
    --with-http_addition_module \
    --with-http_xslt_module=dynamic \
    --with-http_image_filter_module \
    --with-http_geoip_module=dynamic \
    --with-http_sub_module \
    --with-http_dav_module \
    --with-http_flv_module \
    --with-http_mp4_module \
    --with-http_gunzip_module \
    --with-http_gzip_static_module \
    --with-http_auth_request_module \
    --with-http_random_index_module \
    --with-http_secure_link_module \
    --with-http_degradation_module \
    --with-http_slice_module \
    --with-http_stub_status_module \
    --with-http_perl_module \
    --with-mail=dynamic \
    --with-mail_ssl_module \
    --with-stream=dynamic \
    --with-stream_ssl_module \
    --with-stream_realip_module \
    --with-stream_geoip_module=dynamic \
    --with-stream_ssl_preread_module

# make
make && make install

# link
ln -s /usr/local/nginx/sbin/nginx /usr/bin/nginx

# check
nginx -v

nginx -t 

#!/bin/sh

CPUTYPE=`printf "all:\n\techo \\${CPUTYPE}\n" | make -f - -s`
export CPUTYPE=${CPUTYPE:=nocona}

cd /usr/work/src/php-5.2.17
make clean -s
export CC=gcc
export CFLAGS="-O2 -pipe -funroll-loops -march=$CPUTYPE"
./configure  --with-apxs2=/usr/sbin/apxs \
 --with-libdir=lib64 \
 --with-mysql \
 --with-iconv \
 --with-pear \
 --enable-mbstring \
 --enable-xml \
 --disable-xmlrpc \
 --enable-libxml \
 --enable-pdo \
 --with-pdo-mysql \
 --with-sqlite \
 --enable-simplexml \
 --disable-xmlreader \
 --disable-xmlwriter \
 --enable-dom \
 --disable-debug \
 --enable-session \
 --without-ming \
 --with-zlib \
 --with-gd \
 --enable-gd-native-ttf \
 --with-png-dir \
 --with-ttf \
 --with-freetype-dir \
 --with-xpm-dir \
 --with-curl \
 --enable-inline-optimization \
 --with-gnu-ld \
 --enable-exif \
 --enable-static \
 --disable-posix \
 --enable-ftp \
 --with-mysqli \
 --with-jpeg-dir \
 --with-gettext \
 --enable-sockets \
 --with-zend-vm=CALL \
 --with-openssl \
 --with-pcre-regex \
 --enable-zip

make -s all install

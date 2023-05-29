ARG CENTOS_VER=6.10
FROM centos:${CENTOS_VER}
ENV PHP_VERSION 5.2.17

# Apache installation and PHP 5.2 dependency installation
RUN curl https://www.getpagespeed.com/files/centos6-eol.repo --output /etc/yum.repos.d/CentOS-Base.repo
RUN yum -y install epel-release && yum -y update
RUN yum install -y \
  httpd \
  httpd-devel \
  mod_geoip \
  libaio-devel \
  libmcrypt-devel \
  libjpeg-devel \
  libpng-devel \
  libxml2-devel \
  libxslt-devel \
  curl-devel \
  freetype-devel \
  gmp-devel \
  mysql-devel \
  openssl-devel \
  postgresql-devel \
  sqlite-devel \
  gcc \
  libgcj-devel \
  libXpm \
  libXpm-devel \
  mysql \
  perl-DBI \
  perl-DBD-MySQL \
  perl-libwww-perl

RUN rpm -ivh http://download.ispsystem.com/repo/centos/release/6/x86_64/mod_rpaf-0.8.2-1.el6.x86_64.rpm

WORKDIR /usr/work/src
COPY ./php52.tar.gz /usr/work/src
COPY ./do_php52.sh /usr/work/src
RUN tar xf ./php52.tar.gz -C ./
RUN sh ./do_php52.sh

RUN yum clean all
RUN rm -rf /usr/work/src

RUN mkdir -p /var/lib/mysql

EXPOSE 80

CMD /usr/sbin/httpd -DFOREGROUND

FROM php:7.3.33-apache-buster 

RUN rm /etc/apt/sources.list \
    && echo 'deb http://archive.debian.org/debian buster main contrib non-free'  >> /etc/apt/sources.list \
    && echo 'deb http://archive.debian.org/debian buster-updates main contrib non-free'  >> /etc/apt/sources.list \
    && echo 'deb http://archive.debian.org/debian-security buster/updates main contrib non-free'  >> /etc/apt/sources.list \
    && apt-get update

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN install-php-extensions pgsql pdo pdo_pgsql gd curl mbstring openssl

COPY ./php.ini-development $PHP_INI_DIR/conf.d/00-local.ini
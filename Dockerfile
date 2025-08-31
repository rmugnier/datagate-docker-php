# PHP 7.3.19, Apache 2.4.38 in production
FROM php:7.3.33-apache-buster 

RUN rm /etc/apt/sources.list \
    && echo 'deb http://archive.debian.org/debian buster main contrib non-free'  >> /etc/apt/sources.list \
    && echo 'deb http://archive.debian.org/debian buster-updates main contrib non-free'  >> /etc/apt/sources.list \
    && echo 'deb http://archive.debian.org/debian-security buster/updates main contrib non-free'  >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql --with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pgsql pdo pdo_pgsql

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
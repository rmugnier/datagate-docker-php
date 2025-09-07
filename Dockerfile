FROM php:7.4-apache-buster 

RUN rm /etc/apt/sources.list \
    && echo 'deb http://archive.debian.org/debian buster main contrib non-free'  >> /etc/apt/sources.list \
    && echo 'deb http://archive.debian.org/debian buster-updates main contrib non-free'  >> /etc/apt/sources.list \
    && echo 'deb http://archive.debian.org/debian-security buster/updates main contrib non-free'  >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y \ 
        # required for pgsql
        libpq-dev \  
        # required for gd
        libfreetype-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        # required for curl
        libcurl4-openssl-dev \  
        curl \
    && docker-php-ext-configure pgsql --with-pgsql=/usr/local/pgsql \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pgsql pdo pdo_pgsql gd curl mbstring openssl

COPY ./php.ini-development $PHP_INI_DIR/conf.d/00-local.ini
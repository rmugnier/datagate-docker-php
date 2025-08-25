FROM php:7.3.33-apache-buster

RUN apt-get update \
    && apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql --with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pgsql pdo pdo_pgsql
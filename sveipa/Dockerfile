FROM php:5.6-fpm

RUN apt-get update && \
    apt-get install -y libmcrypt-dev && \
    apt-get install -y libxml2-dev

RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install mysql
RUN docker-php-ext-install xml
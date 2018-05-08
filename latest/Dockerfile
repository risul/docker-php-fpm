FROM php:fpm

# Install zip pdo pdo_mysql extensions
RUN apt-get update \
    && apt-get install -y zlib1g-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install zip pdo pdo_mysql

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

# Set working directory
WORKDIR /var/www
ARG BASE_PHP_VERSION=8.4
ARG WWWGROUP=1000
ARG WWWUSER=1000

FROM php:${BASE_PHP_VERSION}
ARG WWWGROUP
ARG WWWUSER

ENV APP_TIMEZONE=UTC

RUN ln -snf /usr/share/zoneinfo/${APP_TIMEZONE} /etc/localtime && echo ${APP_TIMEZONE} > /etc/timezone

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install system dependencies and PHP extensions (including PostgreSQL)
RUN apt-get update && apt-get install -y \
    unzip \
    nano \
    git \
    vim-tiny \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libpq-dev \
    libicu-dev \
    pkg-config \
    && docker-php-ext-install zip mbstring pdo pdo_mysql pdo_pgsql xml curl gd intl bcmath fileinfo

# set up user and group
RUN groupadd --force -g $WWWGROUP sot \
    && useradd -ms /bin/bash --no-user-group -g $WWWGROUP -u $WWWUSER sot;

# Add redis by pecl
RUN pecl install redis \
    && docker-php-ext-enable redis

USER sot

WORKDIR /var/www/html

# keep container running
CMD ["sleep", "infinity"]

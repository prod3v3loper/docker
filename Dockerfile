##########################################
#
# Dockerfile
#
# See:          
#
# Author:       prod3v3loper
# Copyright:    prod3v3loper
# License:      MIT
# Since:        v1.0
# Link:         https://github.com/prod3v3loper/docker
#
##########################################

FROM php:8.0-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
        nano \
        vim \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
	&& docker-php-ext-install -j$(nproc) gd

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql mysqli && docker-php-ext-enable mysqli

# Copy files to container htdocs
COPY ./var/www /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# COPY ./apache/vhost.conf /etc/apache2/sites-available/000-default.conf

# RUN npm install --production

# Get latest Composer
# COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
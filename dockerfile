# Use the official PHP image with FPM (adjust PHP version as needed)
FROM php:8.1-fpm

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libpq-dev \
    zip \
    unzip \
    && docker-php-ext-install intl pdo pdo_mysql opcache

# Set the working directory to your Symfony project folder inside the container
WORKDIR /var/www/symfony/app

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy the entire project (including the "app" folder) into the container
COPY . /var/www/symfony

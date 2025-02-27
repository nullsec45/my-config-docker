# Gunakan PHP 8.3 dengan Apache
FROM php:8.3-apache

# Install dependencies dan ekstensi yang dibutuhkan
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libjpeg-dev \
    unzip \
    libpq-dev \
    libwebp-dev \
    && docker-php-ext-install zip \
    && docker-php-ext-install intl \
    && docker-php-ext-install mysqli pdo_mysql \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-configure gd --with-jpeg --with-webp\
    && docker-php-ext-install gd \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install sockets \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install exif \
    && docker-php-ext-install calendar \
    && docker-php-ext-enable intl zip mysqli pdo_mysql pdo_pgsql gd sockets pcntl bcmath exif calendar

# Aktifkan mod_rewrite di Apache
RUN a2enmod rewrite

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

# Set izin folder
RUN chown -R www-data:www-data /var/www/html \
    && chmod 775 -R /var/www/html

# Copy konfigurasi Apache
COPY ./config/apache2.conf /etc/apache2/sites-available/000-default.conf

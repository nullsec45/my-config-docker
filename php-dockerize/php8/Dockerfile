FROM php:8.3-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    libpng-dev \
    libonig-dev\
    libxml2-dev \
    libpng-dev \
    libjpeg-dev \
    && docker-php-ext-install zip \
    && docker-php-ext-install mysqli pdo_mysql \
    && docker-php-ext-enable zip \
    && docker-php-ext-enable mysqli pdo_mysql\
    && docker-php-ext-install zip  \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install gd \
    && docker-php-ext-enable gd  



# Enable Apache modules
RUN a2enmod rewrite

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
&& php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
&& php -r "unlink('composer-setup.php');"

RUN chown -R www-data:www-data /var/www/html

RUN chmod 775 -R /var/www/html

COPY ./config/apache2.conf /etc/apache2/sites-available/000-default.conf

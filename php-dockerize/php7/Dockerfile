FROM php:7.4-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libjpeg-dev \
    libfreetype6-dev \
    pkg-config \
    freetype2-demos \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \ 
    && docker-php-ext-install gd \  
    && docker-php-ext-install zip \
    && docker-php-ext-install mysqli pdo_mysql \
    && docker-php-ext-enable zip \
    && docker-php-ext-enable mysqli pdo_mysql \
    && docker-php-ext-install mbstring

# Run Freetype
RUN pkg-config --modversion freetype2
RUN export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
RUN export FREETYPE2_CFLAGS="-I/usr/include/freetype2"
RUN export FREETYPE2_LIBS="-L/usr/lib -lfreetype"

# Enable Apache modules
RUN a2enmod rewrite

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
&& php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
&& php -r "unlink('composer-setup.php');"

RUN chown -R www-data:www-data /var/www/html && chmod 755 -R /var/www/html

COPY ./config/apache2.conf /etc/apache2/sites-available/000-default.conf

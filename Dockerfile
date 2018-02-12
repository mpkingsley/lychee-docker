
FROM php:rc-apache

# Uncomment the following lines for agressive compiler flags. WARNING!!! NOT COMPATIBLE with swarm.
ENV PHP_CFLAGS="-fstack-protector-strong -fpic -fpie -O3 -march=native" \
    CFLAGS="-march=native -O3 -fpic -fpie -fstack-protector-strong" \
    PHP_CPPFLAGS="$PHP_CFLAGS" \
    CXXFLAGS="$CFLAGS"
# End Aggressive compiler Flags.

RUN apt-get update && apt-get install -y apt-utils \
 && apt-get install -y git zlib1g-dev libfreetype6-dev libjpeg-dev libpng-dev libmagickwand-dev \
 && docker-php-ext-install -j$(nproc) session exif mysqli zip gd &&\
 pecl install imagick &&\
 docker-php-ext-enable imagick

COPY config/php.ini /usr/local/etc/php/
RUN  git clone https://github.com/electerious/Lychee.git /var/www/html \
&& chmod -R 777 /var/www/html/uploads/ /var/www/html/data/

VOLUME /var/www/html/data /var/www/html/uploads

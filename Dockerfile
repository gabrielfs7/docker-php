FROM php:7.1.0-fpm
MAINTAINER gabrielfs7@gmail.com

#
# Install dependencies
#
RUN apt-get update && apt-get install -y \
git \
nginx \
telnet \
mysql-client \
wget \
net-tools \
nano \
unzip \
nodejs \
npm \
libicu-dev \
libtidy-dev \
libmcrypt-dev \
libxml2-dev \
libxslt1-dev \
libfreetype6-dev \
libjpeg62-turbo-dev \
libpng12-dev \
libpq-dev \
libmemcached-dev \
imagemagick \
libmagickwand-dev \
g++ \
supervisor && \
apt-get clean

RUN pecl install redis
RUN pecl install xdebug

#
# PHP - Docker Extensions
#
RUN docker-php-ext-install mbstring && \
docker-php-ext-configure intl && \
docker-php-ext-install intl && \
docker-php-ext-install zip && \
docker-php-ext-install tidy && \
docker-php-ext-install pdo_mysql && \
docker-php-ext-install pdo_pgsql && \
docker-php-ext-install soap && \
docker-php-ext-install -j$(nproc) iconv mcrypt && \
docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
docker-php-ext-install -j$(nproc) gd && \
docker-php-ext-install mysqli && \
docker-php-ext-install mcrypt && \
docker-php-ext-install xmlrpc && \
docker-php-ext-install bcmath && \
docker-php-ext-install xsl

#
# Memcached
#
RUN cd /tmp && \
curl -L -o /tmp/memcached.zip https://github.com/php-memcached-dev/php-memcached/archive/php7.zip && \
unzip /tmp/memcached.zip && \
rm -r /tmp/memcached.zip && \
mkdir -p /usr/src/php/ext/memcached && \
mv php-memcached-php7/* /usr/src/php/ext/memcached && \
docker-php-ext-install memcached && \
docker-php-ext-enable memcached

#
# PHP Apcu
#
RUN cd /tmp/ && \
curl -O https://pecl.php.net/get/apcu-5.1.3.tgz && \
tar zxvf apcu-5.1.3.tgz && \
mv apcu-5.1.3 /usr/src/php/ext/apcu && \
docker-php-ext-install -j$(nproc) apcu

#
# Install composer
#
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#
# Fixing DNS problems
#
RUN echo "8.8.8.8" > /etc/resolv.conf
RUN echo "8.8.4.4" >> /etc/resolv.conf

#
# Configure NGINX
#
RUN mkdir -p /run/nginx
RUN service nginx restart
WORKDIR /var/www/html/workspace

EXPOSE 8080
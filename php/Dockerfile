FROM php:7.1.0-fpm

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    wget \
    supervisor \
    net-tools

#
# Install Composer
#
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

#
# Set timezone
#
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Luxembourg /etc/localtime
RUN "date"

#
# Install Xdebug
#
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
RUN echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.idekey=\"PHPSTORM\"" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

#
# More PHP Extensions
#
RUN docker-php-ext-install mbstring && \
docker-php-ext-configure intl && \
docker-php-ext-install intl && \
docker-php-ext-install zip && \
docker-php-ext-install tidy && \
docker-php-ext-install pdo && \
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
# Instal redis extension
#
RUN pecl install redis

#
# Memcached PHP Extension
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
# Fixing DNS problems
#
RUN echo "8.8.8.8" > /etc/resolv.conf
RUN echo "8.8.4.4" >> /etc/resolv.conf

WORKDIR /var/www/workspace

RUN usermod -u 1000 www-data
RUN chown -R www-data:www-data /var/www/workspace
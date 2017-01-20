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

#
# Install Redis for PHP
#
RUN git clone -b php7 https://github.com/phpredis/phpredis.git && \
 mv phpredis/ /etc/ && \
 cd /etc/phpredis && \
 phpize && \
 ./configure && \
 make && \
 make install

#
# Install Xdebug
#
RUN git clone -b master git://github.com/xdebug/xdebug.git && \
 mv xdebug/ /etc/ && \
 cd /etc/xdebug && \
 phpize && \
 ./configure && \
 make && \
 make install

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
 docker-php-ext-install redis && \
 docker-php-ext-install -j$(nproc) apcu && \
 docker-php-ext-install -j$(nproc) iconv mcrypt && \
 docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
 docker-php-ext-install -j$(nproc) gd && \
 docker-php-ext-install mysqli && \
 docker-php-ext-install mcrypt && \
 docker-php-ext-install xmlrpc && \
 docker-php-ext-install xsl

#
# Imagick
#
RUN cd /tmp && \
 curl -L -o /tmp/imagick.tar.gz https://pecl.php.net/get/imagick-3.4.2.tgz && \
 tar xfz /tmp/imagick.tar.gz && \
 rm -r /tmp/imagick.tar.gz && \
 mv imagick-3.4.2 /usr/src/php/ext/imagick && \
 docker-php-ext-install imagick && \
 docker-php-ext-enable imagick

#
# Memcached
#
RUN cd /tmp && \
 curl -L -o /tmp/memcached.zip https://github.com/php-memcached-dev/php-memcached/archive/php7.zip && \
 unzip /tmp/memcached.zip && \
 rm -r /tmp/memcached.zip && \
 mv php-memcached-php7 /usr/src/php/ext/memcached && \
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
# Setup confoguration
#
ADD supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD nginx/vhost.prod /etc/nginx/sites-enabled/default
ADD php/php.ini /usr/local/etc/php/php.ini
ADD php/conf.d /usr/local/etc/php/conf.d

#
# SSH Configuration
#
ADD $HOME/.ssh/id_rsa /root/.ssh/id_rsa
ADD $HOME/.ssh/id_rsa.pub /root/.ssh/id_rsa.pub

#
# Fixing DNS problems
#
RUN echo "8.8.8.8" > /etc/resolv.conf
RUN echo "8.8.4.4" >> /etc/resolv.conf

#
# Mount Nginx public directory if it does not exists
#
RUN mkdir -p $HOME/workspace

#
# Configure NGINX
#
RUN mkdir -p /run/nginx
RUN service nginx restart
WORKDIR /var/www/html/workspace

#
# Displaying information:
#
RUN php -r "echo '--- PHP EXTENSIONS ---' . PHP_EOL . PHP_EOL . implode(PHP_EOL, get_loaded_extensions());"

EXPOSE 8080
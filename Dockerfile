FROM php:7.0.2-fpm
MAINTAINER gabrielfs7@gmail.com

# Install dependencies
RUN apt-get update && apt-get install -y git nginx wget net-tools nano unzip supervisor && apt-get clean

# Install Redis for PHP
RUN git clone -b php7 https://github.com/phpredis/phpredis.git && mv phpredis/ /etc/ && cd /etc/phpredis && phpize && ./configure && make && make install

# Install Xdebug
RUN git clone -b master git://github.com/xdebug/xdebug.git && mv xdebug/ /etc/ && cd /etc/xdebug && phpize && ./configure && make && make install

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Setup confoguration
ADD supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD nginx/vhost.prod /etc/nginx/sites-enabled/default
ADD php/php.ini /usr/local/etc/php/php.ini
ADD php/conf.d /usr/local/etc/php/conf.d

# Restart PHP, Nginx, Redis, Memcached
RUN service nginx restart

# Displaying information:
# RUN php -r "echo '--- PHP EXTENSIONS ---' . PHP_EOL . PHP_EOL . implode(PHP_EOL, get_loaded_extensions());"

# Mount Nginx public directory
RUN mkdir -p $HOME/workspace

WORKDIR /var/www/html/workspace

EXPOSE 8080
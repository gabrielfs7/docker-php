FROM debian:stretch

RUN apt-get update && apt-get install -y \
    nginx

ADD nginx.conf /etc/nginx/
ADD vhost.conf /etc/nginx/sites-available/

RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/vhost.conf /etc/nginx/sites-enabled/vhost.conf

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

RUN usermod -u 1000 www-data

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
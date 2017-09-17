#!/bin/sh
docker stop dockerphp_nginx
docker stop dockerphp_php
docker stop dockerphp_redis
docker stop dockerphp_memcached
docker stop dockerphp_mysql
docker stop dockerphp_rabbitmq
docker stop dockerphp_elasticsearch_1
docker stop dockerphp_elasticsearch_2
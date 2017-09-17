#!/bin/sh
docker start dockerphp_nginx
docker start dockerphp_php
docker start dockerphp_redis
docker start dockerphp_memcached
docker start dockerphp_mysql
docker start dockerphp_rabbitmq
docker start dockerphp_elasticsearch_1
docker start dockerphp_elasticsearch_2
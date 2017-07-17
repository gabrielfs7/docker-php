#!/bin/sh
docker start dockerphp-web
docker start dockerphp-redis
docker start dockerphp-memcached
docker start dockerphp-mariadb
docker start dockerphp-rabbitmq
docker start dockerphp-elasticsearch-1
docker start dockerphp-elasticsearch-2
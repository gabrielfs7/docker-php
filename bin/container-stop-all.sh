#!/bin/sh
docker stop dockerphp-web
docker stop dockerphp-redis
docker stop dockerphp-memcached
docker stop dockerphp-mariadb
docker stop dockerphp-elasticsearch-1
docker stop dockerphp-elasticsearch-2
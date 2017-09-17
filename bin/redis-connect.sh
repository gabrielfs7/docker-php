#!/bin/sh
echo "\n"
docker exec -it dockerphp_php telnet dockerphp_redis 6379
echo "\n"
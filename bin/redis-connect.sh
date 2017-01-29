#!/bin/sh
echo "\n"
docker exec -it dockerphp telnet dockerphp-redis 6379
echo "\n"
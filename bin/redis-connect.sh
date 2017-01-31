#!/bin/sh
echo "\n"
docker exec -it dockerphp-web telnet dockerphp-redis 6379
echo "\n"
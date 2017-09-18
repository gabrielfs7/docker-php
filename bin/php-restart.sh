#!/bin/sh
echo "\n"
docker exec -it dockerphp_php ps aux | grep php
docker exec -it dockerphp_php kill -USR2 1
docker exec -it dockerphp_php ps aux | grep php
echo "\n"

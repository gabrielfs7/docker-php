#!/bin/sh
echo "\n"
docker exec -it -d dockerphp-web service nginx start
echo "\n"

#!/bin/sh
echo "\n"
docker exec -it -d dockerphp_php service nginx restart
echo "\n"

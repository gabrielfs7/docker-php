#!/bin/sh
echo "\n"
docker exec -it dockerphp-web service nginx reload
echo "\n"

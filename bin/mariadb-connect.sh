#!/bin/sh
echo "\n"
docker exec -it dockerphp-web mysql -h dockerphp-mariadb -u root -p
echo "\n"
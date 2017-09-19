#!/bin/sh
CONTAINER_NAME='dockerphp_php'
echo "\n"
docker exec -it -d $CONTAINER_NAME rm -rf /nginx-files
docker cp ./nginx $CONTAINER_NAME:/nginx-files
docker exec -it -d $CONTAINER_NAME chmod -R 777 /nginx-files
docker exec -it -d $CONTAINER_NAME chown -R root:root /nginx-files
docker exec -it -d $CONTAINER_NAME rsync /nginx-files /etc/nginx
docker exec -it -d $CONTAINER_NAME rm -rf /nginx-files
docker exec -it -d $CONTAINER_NAME rm -rf /etc/nginx/sites-enabled
docker exec -it -d $CONTAINER_NAME ln -s /etc/nginx/sites-available /etc/nginx/sites-enabled
docker exec -it -d $CONTAINER_NAME service nginx restart
echo "\n"

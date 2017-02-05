#!/bin/sh
CONTAINER="dockerphp-web"

if [ $1 ]; then
    CONTAINER=$1
fi

docker restart -t 30 $CONTAINER
docker start -i $CONTAINER
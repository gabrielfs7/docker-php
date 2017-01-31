#!/bin/sh

CONTAINER="dockerphp-web"

if [ $1 ]; then
    CONTAINER=$1
fi

docker exec -it $CONTAINER /bin/bash
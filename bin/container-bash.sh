#!/bin/sh

CONTAINER="dockerphp"

if [ $1 ]; then
    CONTAINER=$1
fi

docker exec -it $CONTAINER bash

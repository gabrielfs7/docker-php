#!/bin/sh
if [ ! $1 ]; then
    echo "Error: You must supply the container name."
    exit 0
fi

CONTAINER=$1

docker inspect $CONTAINER | grep "\"IPAddress\": \""

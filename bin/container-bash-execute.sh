#!/bin/sh

if [ ! $1 ] || [ ! $2 ]; then
    echo "Error: You must supply the container name and the command."
    exit 0
fi

CONTAINER=$1
COMMAND=$2

docker exec -it $CONTAINER $COMMAND

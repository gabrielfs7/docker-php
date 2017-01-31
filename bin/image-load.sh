#!/bin/sh
IMAGE="dockerphp_web"

if [ $1 ]; then
    IMAGE=$1
fi

LOAD_PATH=$HOME/$IMAGE

echo "\n"
echo "Loading ${IMAGE} from ${LOAD_PATH}..."
docker load -i $LOAD_PATH
echo "\n"
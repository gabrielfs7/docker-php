#!/bin/sh
IMAGE="dockerphp_web"

if [ $1 ]; then
    IMAGE=$1
fi

SAVE_PATH=$HOME/$IMAGE

echo "\n"
echo "Saving ${IMAGE} to ${SAVE_PATH}..."
docker save $IMAGE -o $SAVE_PATH
echo "\n"
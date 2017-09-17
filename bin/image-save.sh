#!/bin/sh
IMAGE=$1

SAVE_PATH=$HOME/$IMAGE

echo "\n"
echo "Saving ${IMAGE} to ${SAVE_PATH}..."
docker save $IMAGE -o $SAVE_PATH
echo "\n"
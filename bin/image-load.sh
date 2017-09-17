#!/bin/sh
IMAGE=$1

LOAD_PATH=$HOME/$IMAGE

echo "\n"
echo "Loading ${IMAGE} from ${LOAD_PATH}..."
docker load -i $LOAD_PATH
echo "\n"
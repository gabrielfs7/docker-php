#!/bin/sh
source bin/environment.sh
docker-machine create -d virtualbox --virtualbox-memory $MACHINE_MEM_SIZE dev
docker-machine start dev
docker-machine env dev
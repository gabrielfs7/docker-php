#!/bin/sh
docker-machine create -d virtualbox dev
docker-machine start dev
docker-machine env dev

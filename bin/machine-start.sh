#!/bin/sh
docker-machine create -d virtualbox dev
docker-machine restart dev
docker-machine env dev

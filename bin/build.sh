#!/bin/sh
source bin/environment.sh
docker-compose down
docker-compose build
docker-compose up -d
#!/bin/sh
docker-compose down
docker-compose build
docker-compose up -d
bin/nginx-sync.sh
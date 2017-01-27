#!/bin/sh
source bin/environment.sh
docker-compose build
docker-compose up -d
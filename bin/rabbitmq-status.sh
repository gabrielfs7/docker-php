#!/bin/sh
echo "\n"
docker exec -it dockerphp-rabbitmq rabbitmqctl cluster_status
echo "\n"
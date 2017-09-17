#!/bin/sh
echo "\n"
docker exec -it dockerphp_rabbitmq rabbitmqctl cluster_status
echo "\n"
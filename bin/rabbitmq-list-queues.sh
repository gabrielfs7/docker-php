#!/bin/sh
echo "\n"
docker exec -it dockerphp_rabbitmq rabbitmqctl list_queues
echo "\n"
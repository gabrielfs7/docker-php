#!/bin/sh
echo "\n"
docker exec -it dockerphp-rabbitmq rabbitmqctl list_queues
echo "\n"
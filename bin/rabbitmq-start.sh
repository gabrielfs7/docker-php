#!/bin/sh
echo "\n"
docker exec -it dockerphp-rabbitmq rabbitmqctl start_app
echo "\n"
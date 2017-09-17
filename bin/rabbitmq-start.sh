#!/bin/sh
echo "\n"
docker exec -it dockerphp_rabbitmq rabbitmqctl start_app
echo "\n"
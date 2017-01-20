#!/bin/sh
docker exec -it dockerphp nginx -c /etc/nginx/nginx.conf -t
echo "Nginx status..."
docker exec -it dockerphp service nginx status

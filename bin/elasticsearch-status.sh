#!/bin/sh
echo "\n"
docker exec -it dockerphp-web curl -XGET http://dockerphp-elasticsearch-1:9200/_cluster/health
echo "\n"

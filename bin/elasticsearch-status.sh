#!/bin/sh
echo "\n"
docker exec -it dockerphp_php curl -XGET http://dockerphp_elasticsearch_1:9200/_cluster/health
echo "\n"

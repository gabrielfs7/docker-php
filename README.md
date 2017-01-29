# Docker PHP

A project that easily provides a php developer's standard environment using Docker with the most important features:

* PHP 7
* XDebug
* NGinx
* Memcached
* MariaDB
* Redis
* ElasticSearch

### Download the project:

1. Download the project to somewhere in your machine, for example: /dockerphp
2. Access the project folder, for example: cd /dockerphp

### If using Docker Machine:

If you are on MAC OS you'll need to install Docker Machine to virtualize a Linux OS Kernel. After install Docker Machine, create one:

Start Docker Machine by typing:

```
bin/machine-start.sh
eval $(docker-machine env dev)
```

Recreate Docker Machine by typing:

```
bin/machine-recreate.sh
eval $(docker-machine env dev)
```

### Select ENV or PROD environment configuration ####

1. open bin/environment.sh file
2. set the ENV=dev or ENV=prod

### Build and runnig:

```
bin/build.sh
```

### Access from your local machine

If using docher-machine, discover your virtual ip by typing:
```
bin/machine-ip.sh
```

Access in your browser:
```
http://YOUR_IP:8080
```

YOUR_IP = localhost or docher-machine ip.

### Stopping:

```
docker-compose kill
```

### List all containers

```
bin/container-list.sh
```

### List all images

```
bin/container-list-images.sh
```

### Forcing removal all containers

```
bin/container-remove-all.sh
```

### Forcing removal all images

```
bin/container-remove-all-images.sh
```

### Discovering errors/viewing logs

```
docker-compose logs
```

### Running commands inside the container

```
bin/container-bash-execute.sh dockerphp 'curl localhost:8080'
```

### Access container Bash (line command)

```
bin/container-bash.sh
```

### Get container IP

```
bin/container-ip.sh dockerphp-mariadb
```

## Accessing the services containers from inside dockerphp container

```
dockerphp-mariadb:3306
dockerphp-redis:6380
dockerphp-memcached:11211
dockerphp-elasticsearch1:9200
```

### Accessing MariaDB:

```
bin/mariadb-connect.sh
```

### Accessing Redis:

```
bin/redis-connect.sh
```

### Test Elasticsearch cluster status

```
bin/elasticsearch-status.sh
```
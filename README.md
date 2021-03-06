# Docker PHP

A project that easily provides a php developer's standard environment using Docker with the most important features:

* PHP 7.1
* XDebug
* NGinx
* Memcached
* MariaDB
* Redis
* ElasticSearch
* RabbitMQ

## Install/Configure

### Download the project:

1. Download the project to somewhere in your computer, for example: /dockerphp
2. Access the project folder, for example: cd /dockerphp

### If using Docker for MacOS

Download Docker for MacOS here:

https://docs.docker.com/docker-for-mac/#/download-docker-for-mac

1. Download and install Docker for Mac
2. Start it as the documentation shows!

### Build and runnig:

```
bin/build.sh
```

Configure your local etc/hosts by adding:
```
127.0.0.1 dockerphp
```

Sync your nginx files located in nginx/sites-available folder
```
bin/nginx-sync.sh
```

Access in your browser:
```
http://dockerphp
```

### Stopping:

```
docker-compose kill
```

### List all containers

```
bin/container-list.sh
```

### Stoping all containers

```
bin/container-stop-all.sh
```

### Starting all containers

```
bin/container-start-all.sh
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

### Sync Nginx vhost and configuration

This will update any vhost configuration, etc to your Nginx. Add new files to nginx directory to sync.

```
bin/nginx-sync.sh
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

## Saving/Loading

To avoid lose image content you can backup/load it by:

### Saving image

```
bin/image-save.sh dockerphp_web
```

### Loading image

```
bin/image-load.sh dockerphp_web
```

## Container startup problems

If you are getting any container startup issues, for example if your container keep restarting, you can use the command bellow to start the container with debug mode.

```
bin/container-restart.sh dockerphp-mariadb
```
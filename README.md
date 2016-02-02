# Docker PHP

A project that easily provides a php developer's standard environment using Docker with the most important features:

* PHP 7
* NGinx
* MariaDB
* Redis
* Memcache
* XDebug

### If using Docker Machine:

If you are on MAC OS you'll need to install Docker Machine to virtualize a Linux OS Kernel. After install Docker Machine, create one:

1. Start Docker Machine by typing:

```
docker-machine create -d virtualbox dev
docker-machine start dev
docker-machine env dev
eval $(docker-machine env dev)
```

### Build and runnig:

1. Download the project to somewhere in your machine, for example: /docker-php
2. Inside the folder, execute the following command:
    ```
    docker-compose build
    docker-compose up -d
    ```
3. Run the container:
    ``` 
    docker run -d -v $HOME/workspace:/var/www/html/workspace -it dockerphp_web /bin/bash
    ```

### Stopping:

```
docker-compose kill
```

### Forcing removal all containers

```
docker rm -f $(docker ps -a -q)
```

### Forcing removal all images

```
docker rmi -f $(docker images -q)
```
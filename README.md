# docker-php
A project that easily provides a php developer's standard environment using Docker.


1. Download de project to somewhere in your machine, for example: /docker-php
2. Execute the following command:
    docker build -t docker-php:1.0 /docker-php
3. Run the container:
    docker run -v $HOME/workspace:/var/www/html/workspace -it docker-php:1.0 /bin/bash
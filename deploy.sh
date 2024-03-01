#!/bin/bash

docker rm -f $(docker ps -aq)

docker network create new-network

docker build -t task6-mysql db

docker build -t task6-flask-app:latest flask-app

docker run -d \
        --name mysql \
        --network new-network \
        task6-mysql

docker run -d \
        --env MYSQL_ROOT_PASSWORD=password \
        --name flask-app \
        --network new-network \
        task6-flask-app:latest


docker run -d \
        --name nginx \
        -p 80:80 \
        --network new-network \
        --mount type=bind,source=$(pwd)/nginx/nginx.conf,target=/etc/nginx/nginx.conf \
        nginx:latest


echo
docker ps -a
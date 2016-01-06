#!/usr/bin/env bash

# Build Docker images
docker build -t afrozaar/ubuntu-mysql-apache-php -f ./base-docker/Dockerfile ./base-docker
docker build -t afrozaar/wordpress .

# Add docker.dev to /etc/hosts
./add-docker.dev-to-hosts

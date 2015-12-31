#!/usr/bin/env bash

# Build Docker images
docker build -t johanmynhardt/ubuntu-mysql-apache-php -f ./base-docker/Dockerfile ./base-docker
docker build -t johanmynhardt/wordpress .

# Add docker.dev to /etc/hosts
./add-docker.dev-to-hosts


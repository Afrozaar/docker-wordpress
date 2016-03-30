#!/usr/bin/env bash

# special flavour: 422
if [ "" != "$FLAVOUR" ]; then
  echo "Flavour: $FLAVOUR"
fi

# Build Docker images
#docker build -t afrozaar/ubuntu-mysql-apache-php -f ./base-docker/Dockerfile$FLAVOUR ./base-docker

if [ "" != "$FLAVOUR" ]; then
  echo "Building with tag flavour: $FLAVOUR";
  #docker build -t afrozaar/ubuntu-mysql-apache-php -f ./base-docker/Dockerfile$FLAVOUR ./base-docker
  docker build -t afrozaar/wordpress:$FLAVOUR -f ./Dockerfile.$FLAVOUR .
else
  echo "Building normally"
  #docker build -t afrozaar/ubuntu-mysql-apache-php -f ./base-docker/Dockerfile ./base-docker
  docker build -t afrozaar/wordpress .
fi;

#docker build -t afrozaar/wordpress .

# Add docker.dev to /etc/hosts
./add-docker.dev-to-hosts

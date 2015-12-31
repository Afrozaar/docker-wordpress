# johanmynhardt/ubuntu-mysql-apache-php
FROM ubuntu:14.04
MAINTAINER Johan Mynhardt <johanmynhardt@gmail.com>
RUN apt-get update
RUN apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-client mysql-server apache2 libapache2-mod-php5 pwgen python-setuptools vim-tiny php5-mysql php5-ldap
RUN a2enmod rewrite
RUN easy_install supervisor

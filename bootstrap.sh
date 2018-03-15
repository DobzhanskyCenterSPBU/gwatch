#!/usr/bin/env bash

apt-get update
apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi

apt-get install -y git
apt-get install libapache2-mod-php7.0
a2enmod rewrite
apt-get install -y mysql-server
apt-get install php7.0
apt-get install php7.0-gd
apt-get install php7.0-mysql
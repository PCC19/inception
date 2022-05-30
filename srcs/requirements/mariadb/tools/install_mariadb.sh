#!/bin/bash

# Make updates and upgrades
apt-get upgrade && apt-get update

#Install some tools (vim wget openssl man)
apt-get install -y vim man procps

#Install MariaDB
apt-get install -y mariadb-server

# Copy config file to correct location
cp ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

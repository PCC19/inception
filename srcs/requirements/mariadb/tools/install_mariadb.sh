#!/bin/bash

# Make updates and upgrades
apt-get upgrade && apt-get update

#Install some tools (vim wget openssl man)
apt-get install -y vim man

#Install MariaDB
apt-get install -y mariadb-server
